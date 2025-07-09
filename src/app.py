import os
from io import BytesIO
from dotenv import load_dotenv
from datetime import datetime
from flask import (
    Flask,
    render_template,
    redirect,
    url_for,
    request,
    session,
    flash,
    send_file,
)
from models import *
from helpers import *
from procedures import *
from docente import docente
from funcionario import funcionario


load_dotenv('src/.env')

app = Flask(__name__)
app.secret_key = os.getenv('APP_SECRET_KEY')
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE')

database = os.getenv('DATABASE')
secret_key = os.getenv('APP_SECRET_KEY')

db.init_app(app)
app.app_context().push()
app.register_blueprint(funcionario, url_prefix='/funcionario')
app.register_blueprint(docente, url_prefix='/docente')


@app.route('/')
@app.route('/home')
def home():
    if 'nome' in session:
        return render_template('home/home.html', nome=session['nome'])
    # TODO adicionar lógica flag
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
            session['user_type'] = 'discente'

            return redirect(url_for('home'))

        return render_template('log_forms/log_discente.html')

    return (
        redirect(url_for('home'))
        if 'nome' in session
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

        # Verificar curso antes

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
            session['id'] = request.form['cpf']
            session['user_type'] = 'discente'

            return redirect(url_for('home'))

        else:
            return render_template(
                'log_forms/log_discente.html',
                user_exists=True,
                invalid_credentials=True,
                sign_up=True,
                cursos=cursos,
            )

    return (
        redirect(url_for('home'))
        if 'nome' in session
        else render_template('log_forms/log_discente.html', sign_up=True, cursos=cursos)
    )


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
                problema=descricao, data_abertura=data, id_usuario=usuario.cpf
            )
            db.session.add(nova_ocorrencia)
            db.session.commit()
            return redirect(url_for('home'))
        else:
            return "Usuário não encontrado", 400

    return render_template(
        'adicionar/ocorrencia.html',
        nome=session['nome'],
        tipo_usuario=session['user_type'],
    )


@app.route('/minhas_ocorrencias', methods=['GET', 'POST'])
def minhas_ocorrencias():
    if 'nome' not in session or 'id' not in session:
        return redirect(url_for('login'))
    termo_busca = None
    ocorrencias = []
    if request.method == 'POST':
        termo_busca = request.form.get('termo_busca')
    ocorrencias = OcorrenciaProcedures.listar_por_usuario_logado(
        id_usuario=session['id'], termo_busca=termo_busca
    )
    return render_template(
        'consultar/ocorrencia.html',
        nome=session['nome'],
        ocorrencias=ocorrencias,
        usuario=None,
    )


@app.route('/minhas_ocorrencias/excluir/<int:id_ocorrencia>', methods=['POST'])
def excluir_ocorrencia(id_ocorrencia):
    if OcorrenciaProcedures.excluir_por_id(id_ocorrencia):
        flash('Ocorrência excluída com sucesso.', 'success')
    else:
        flash('Erro ao excluir ocorrência.', 'danger')
    return redirect(url_for('home'))  # ou a página de ocorrências


@app.route('/user_image')
def user_image():
    cpf = session['id']
    usuario = Usuario.query.get(cpf)
    if usuario and usuario.foto_binaria:
        return send_file(
            BytesIO(usuario.foto_binaria),
            mimetype='image/jpeg',  # Use 'image/jpeg' if you only accept JPGs
        )
    else:
        return send_file('static/images/base_user.jpeg', mimetype='image/jpeg')


@app.route('/configuracoes')
def configuracoes():
    cursos = Curso.query.all()
    discente = session['user_type'] == 'discente'
    if 'nome' in session:
        cpf = session['id']
        usuario = Usuario.query.get(cpf)
        return render_template(
            'configuracoes/configuracoes.html',
            nome=session['nome'],
            user_id=cpf,
            email=usuario.email,
            discente=discente,
            cursos=cursos,
        )
    # TODO: flag not logged in
    return redirect(url_for('login'))


@app.route('/perfil', methods=['GET', 'POST'])
def perfil():
    cpf = session['id']
    usuario = Usuario.query.get(cpf)
    if request.method == 'POST':
        senha = request.form['senha_atual']
        if usuario and usuario.senha == senha:
            usuario.nome = request.form['nome']
            usuario.email = request.form['email']

            if session['user_type'] == 'discente':
                discente = Discente.query.filter_by(cpf=cpf).first()
                discente.id_curso = request.form['id_curso']

            nova_senha = request.form['nova_senha']
            confirmar_nova_senha = request.form['confirmar_nova_senha']

            if nova_senha == confirmar_nova_senha:
                usuario.senha = request.form['nova_senha']
                file = request.files.get('profile_pic')
                if file and file.filename != '':
                    usuario.foto_binaria = file.read()
                db.session.commit()

                session['nome'] = request.form['nome']
                # TODO ADICIONAR FLAG INVALIDO
        # TODO flag senha/user invalido
        return redirect(url_for('perfil'))
    return (
        redirect(url_for('configuracoes'))
        if 'nome' in session
        else render_template('log_forms/log_discente.html')
    )


@app.route('/delete_account', methods=['POST'])
def delete_account():
    cpf = session['id']
    usuario = Usuario.query.get(cpf)
    db.session.delete(usuario)  # Mark the user for deletion
    db.session.commit()
    return redirect(url_for('logout'))


@app.route('/minhas_ocorrencias/editar/<int:id_ocorrencia>', methods=['POST'])
def editar_ocorrencia(id_ocorrencia):
    print(id_ocorrencia, request.form['descricao'])
    if OcorrenciaProcedures.editar_por_id(id_ocorrencia, request.form['descricao']):
        flash('Ocorrência editada', 'success')
    else:
        flash('Erro ao editar ocorrência.', 'danger')
    return redirect(url_for('home'))  # ou a página de ocorrências


if __name__ == '__main__':
    # db.create_all()
    app.run(debug=True)
