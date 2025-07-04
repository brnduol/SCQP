from datetime import datetime
from flask import Flask, render_template, redirect, url_for, request, session

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
            return redirect(url_for('home'))

        return render_template('log_forms/log_discente.html')

    return (
        redirect(url_for('home'))
        if 'name' in session
        else render_template('log_forms/log_discente.html')
    )


@app.route('/sign_up', methods=['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        cpf = request.form['cpf']
        nome = request.form['nome']
        email = request.form['email']
        senha = request.form['senha']

        matricula = request.form['matricula']
        curso = clean_string(request.form['curso'])
        data_inicio = datetime.strptime(request.form['data_inicio'], '%Y-%m-%d').date()
        data_termino = datetime.strptime(
            request.form['data_termino'], '%Y-%m-%d'
        ).date()

        #Verificar curso antes
        pre_id_curso = Curso.query.filter_by(nome=curso).first()
        if pre_id_curso:
            id_curso = pre_id_curso.id
        else:
            id_curso = None

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
            sign_up=True,
        )
    cursos = Curso.query.all()
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


if __name__ == '__main__':
    db.create_all()
    app.run(debug=True)
