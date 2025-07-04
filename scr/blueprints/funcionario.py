from flask import Blueprint, render_template, redirect, url_for, request, session


from models import *
from helpers import *

funcionario = Blueprint(
    'funcionario', __name__, static_folder='static', template_folder='template'
)


@funcionario.route('/')
def index():
    return redirect(url_for('login'))


@funcionario.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        senha = request.form['senha']

        user_credentials = verify_credentials_login(
            email=email, senha=senha, type_usr='funcionario'
        )
        if user_credentials:
            session['nome'] = user_credentials.nome
            return redirect(url_for('funcionario.home'))

        return render_template('log_forms/log_funcionario.html')

    return (
        redirect(url_for('home'))
        if 'name' in session
        else render_template('log_forms/log_funcionario.html')
    )


@funcionario.route('/sign_up', methods=['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        cpf = request.form['cpf']
        nome = request.form['nome']
        email = request.form['email']
        senha = request.form['senha']

        matricula = request.form['matricula']

        if verify_credentials_sign_up(cpf=cpf):
            usuario = Usuario(
                cpf=cpf,
                nome=nome,
                email=email,
                senha=senha,
            )
            db.session.add(usuario)

            funcionario = Funcionario(
                matricula=matricula,
                cpf=cpf,
            )
            db.session.add(funcionario)

            db.session.commit()

            session['nome'] = request.form['nome']

            return redirect(url_for('funcionario.home'))

        return render_template(
            'log_forms/log_funcionario.html',
            invalid_credentials=True,
            sign_up=True,
        )

    return (
        redirect(url_for('funcionario.home'))
        if 'nome' in session
        else render_template('log_forms/log_funcionario.html', sign_up=True)
    )


@funcionario.route('/home')
def home():
    if 'nome' in session:
        return render_template('home/home_funcionario.html', nome=session['nome'])
    return render_template('home/home_funcionario.html', not_login=True)
