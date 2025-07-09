from flask import Blueprint, render_template, redirect, url_for, request, session

from models import *
from helpers import *
from procedures import *

docente = Blueprint(
    'docente', __name__, static_folder='static', template_folder='template'
)


@docente.route('/')
@docente.route('/home')
def home():
    if 'nome' in session:
        return render_template('home/home.html', nome=session['nome'])
    # TODO adicionar lógica flag
    return redirect(url_for('docente.login'))


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
            session['id'] = user_credentials.cpf
            session['user_type'] = 'docente'

            return redirect(url_for('docente.home'))

        return render_template('log_forms/log_docente.html')

    return (
        redirect(url_for('docente.home'))
        if 'nome' in session
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
        id_departamento = request.form['id']

        # Verificar depto antes
        departamento = Departamento.query.filter_by(id=id_departamento).first()
        print()
        if departamento:
            id_departamento = departamento.id
        else:
            id_departamento = None

        if verify_credentials_sign_up(cpf=cpf) and id_departamento:
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
            session['id'] = request.form['cpf']
            session['user_type'] = 'docente'

            return redirect(url_for('docente.home'))

        else:
            return render_template(
                'log_forms/log_docente.html', user_exists=True, sign_up=True
            )

    departamentos = Departamento.query.all()

    return render_template(
        'log_forms/log_docente.html',
        invalid_credentials=True,
        sign_up=True,
        departamentos=departamentos,
    )


@docente.route('/minhas_ocorrencias', methods=['GET', 'POST'])
def minhas_ocorrencias():
    if 'nome' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        if request.termo_busca:
            ocorrencias = get_ocorrencias(request.termo_busca)
    else:
        ocorrencias = get_ocorrencias()

    return render_template(
        'consultar/ocorrencia.html',
        nome=session['nome'],
        ocorrencias=ocorrencias,
        usuario=None,
    )
