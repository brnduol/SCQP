from flask import Blueprint, render_template, redirect, url_for, request, session

from models import *
from helpers import *

docente = Blueprint(
    'docente', __name__, static_folder='static', template_folder='template'
)


@docente.route('/')
def index():
    return redirect(url_for('login'))


# @docente.route('/login', methods=['GET'])
# def login():
#     return render_template('log_forms/log_docente.html')


# @docente.route('/sign_up', methods=['GET'])
# def sign_up():
#     return render_template('log_forms/log_docente.html', sign_up=True)


@docente.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        senha = request.form['senha']

        user_credentials = verify_credentials_login(
            email=email, senha=senha, type_usr='docente'
        )
        if user_credentials:
            session['nome'] = user_credentials.nome
            return redirect(url_for('home'))

        return render_template('log_forms/log_docente.html')

    return (
        redirect(url_for('home'))
        if 'name' in session
        else render_template('log_forms/log_docente.html')
    )


@docente.route('/sign_up', methods=['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        cpf = request.form['cpf']
        nome = request.form['nome']
        email = request.form['email']
        senha = request.form['senha']

        matricula = request.form['matricula']
        nome_departamento = clean_string(request.form['nome_departamento'])
        
        #Verificar depto antes
        departamento = Departamento.query.filter_by(nome=nome_departamento).first()
        if departamento:
            id_departamento = departamento.id
        else:
            id_departamento = None

        

        if verify_credentials_sign_up(cpf=cpf) and id_departamento:
            print(nome_departamento)
            usuario = Usuario(
                cpf=cpf,
                nome=nome,
                email=email,
                senha=senha,
            )
            db.session.add(usuario)

            docente = Docente(
                matricula=matricula,
                id_departamento=id_departamento,
                cpf=cpf,
            )
            db.session.add(docente)

            db.session.commit()

            session['nome'] = request.form['nome']

            return redirect(url_for('home'))
        
        else:
            return render_template(
                'log_forms/log_docente.html',
                user_exists=True,
                sign_up=True
            )


    departamentos = Departamento.query.all()

    return render_template(
        'log_forms/log_docente.html',
        invalid_credentials=True,
        sign_up=True, 
        departamentos=departamentos,
    )
