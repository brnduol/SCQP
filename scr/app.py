from datetime import datetime
from flask import Flask, render_template, redirect, url_for, request, session, flash

from models import *
from helpers import *
from blueprints.docente import docente
from blueprints.funcionario import funcionario

from blueprints.docente import docente
from blueprints.funcionario import funcionario



app = Flask(__name__)
app.secret_key = '42'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///db.sqlite3'

db.init_app(app)
app.app_context().push()
app.register_blueprint(funcionario, url_prefix='/funcionario')
app.register_blueprint(docente, url_prefix='/docente')



@app.route('/')
def index():
    return redirect(url_for('login'))


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        senha = request.form['senha']

        user_credentials = verify_credentials_login(
            email=email, senha=senha, type_usr='discente'
        )
        if user_credentials:
            session['nome'] = user_credentials.nome
            session['id'] = user_credentials.cpf
            return redirect(url_for('home'))

        return render_template('log_forms/log_discente.html')

    return (
        redirect(url_for('home'))
        if 'name' in session
        else render_template('log_forms/log_discente.html')
    )


@app.route('/sign_up', methods=['GET', 'POST'])
def sign_up():
    cursos = Curso.query.all()
    if request.method == 'POST':
        cpf = request.form['cpf']
        nome = request.form['nome']
        email = request.form['email']
        senha = request.form['senha']
        id_curso = request.form['id_curso']

        matricula = request.form['matricula']
        # curso = clean_string(request.form['curso'])
        data_inicio = datetime.strptime(request.form['data_inicio'], '%Y-%m-%d').date()
        data_termino = datetime.strptime(
            request.form['data_termino'], '%Y-%m-%d'
        ).date()

        #Verificar curso antes

        if verify_credentials_sign_up(cpf=cpf) and id_curso:
            usuario = Usuario(
                cpf=cpf,
                nome=nome,
                email=email,
                senha=senha,
            )
            db.session.add(usuario)

            discente = Discente(
                matricula=matricula,
                data_de_inicio=data_inicio,
                data_de_termino=data_termino,
                id_curso=id_curso,
                cpf=cpf,
            )
            db.session.add(discente)

            db.session.commit()

            session['nome'] = request.form['nome']

            return redirect(url_for('home'))

        else:
            return render_template(
            'log_forms/log_discente.html',
            user_exists=True,
            invalid_credentials=True,
            sign_up=True, cursos=cursos,
        )
    

    return (
        redirect(url_for('home'))
        if 'nome' in session
        else render_template('log_forms/log_discente.html', sign_up=True, cursos=cursos)
    )


@app.route('/home')
def home():
    if 'nome' in session:
        return render_template('home/home.html', nome=session['nome'])
    return render_template('home/home.html', not_login=True)


@app.route('/logout')
def logout():

    if 'nome' in session:

        session.pop('nome', None)

    return redirect(url_for('login'))


@app.route('/adiciona_ocorrencia', methods=['GET', 'POST'])
def adiciona_ocorrencia():
    if 'nome' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        descricao = request.form['problema']  
        data_str = request.form['data_abertura']  
        data = datetime.strptime(data_str, '%Y-%m-%d').date()

        
        usuario = Usuario.query.filter_by(nome=session['nome']).first()

        if usuario:
            nova_ocorrencia = Ocorrencia(
                problema=descricao,
                data_abertura=data,
                id_usuario=usuario.cpf
            )
            db.session.add(nova_ocorrencia)
            db.session.commit()
            return redirect(url_for('home'))
        else:
            return "Usuário não encontrado", 400

    return render_template('adicionar/ocorrencia.html', nome=session['nome'])

def get_ocorrencias(termo_busca=None):
    
    id_usuario = session['id']
    print(id_usuario)
    query = Ocorrencia.query.filter_by(id_usuario=id_usuario)

    if termo_busca:
        query = query.filter(Ocorrencia.problema.ilike(f"%{termo_busca}%"))

    return query.all()

@app.route('/minhas_ocorrencias', methods=['GET', 'POST'])
def minhas_ocorrencias():
    if 'nome' not in session or 'id' not in session:
        return redirect(url_for('login'))

    termo_busca = None
    ocorrencias = []

    if request.method == 'POST':
        termo_busca = request.form.get('termo_busca')

    ocorrencias = OcorrenciaProcedures.listar_por_usuario_logado(
        id_usuario=session['id'],
        termo_busca=termo_busca
    )

    return render_template(
        'consultar/ocorrencia.html',
        nome=session['nome'],
        ocorrencias=ocorrencias,
        usuario=None
    )


@app.route('/minhas_ocorrencias/excluir/<int:id_ocorrencia>', methods=['POST'])
def excluir_ocorrencia(id_ocorrencia):
    if OcorrenciaProcedures.excluir_por_id(id_ocorrencia):
        flash('Ocorrência excluída com sucesso.', 'success')
    else:
        flash('Erro ao excluir ocorrência.', 'danger')
    return redirect(url_for('home'))  # ou a página de ocorrências

@app.route('/minhas_ocorrencias/editar/<int:id_ocorrencia>', methods=['POST'])

def editar_ocorrencia(id_ocorrencia):
    print(id_ocorrencia,request.form['descricao'])
    if OcorrenciaProcedures.editar_por_id(id_ocorrencia, request.form['descricao']):
        flash('Ocorrência editada', 'success')
    else:
        flash('Erro ao editar ocorrência.', 'danger')
    return redirect(url_for('home'))  # ou a página de ocorrências



if __name__ == '__main__':
    db.create_all()
    app.run(debug=True)
   
