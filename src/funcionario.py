from flask import Blueprint, render_template, redirect, url_for, request, session
from datetime import datetime


from models import *
from helpers import *
from procedures import *

funcionario = Blueprint(
    'funcionario', __name__, static_folder='static', template_folder='template'
)


@funcionario.route('/')
@funcionario.route('/home')
def home():
    if 'nome' in session:
        return render_template('home/home_funcionario.html', nome=session['nome'])
    # TODO adicionar lógica flag
    return redirect(url_for('funcionario.login'))


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
            session['id'] = user_credentials.cpf
            session['user_type'] = 'funcionario'

            return redirect(url_for('funcionario.home'))

        return render_template('log_forms/log_funcionario.html')

    return (
        redirect(url_for('funcionario.home'))
        if 'nome' in session
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
            session['id'] = request.form['cpf']
            session['user_type'] = 'funcionario'

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


@funcionario.route('/adicionar_manutencao', methods=['GET', 'POST'])
def adicionar_manutencao():
    if 'nome' not in session:
        return redirect(url_for('funcionario.login'))

    if request.method == 'POST':
        servico = request.form['servico']
        id_equipamento = request.form['id_equipamento']
        data_str = request.form['data_manutencao']
        id_ocorrencia = request.form.get('id_ocorrencia')
        data = datetime.strptime(data_str, '%Y-%m-%d').date()
        usuario = Usuario.query.filter_by(nome=session['nome']).first()
        funcionario = Funcionario.query.filter_by(cpf=usuario.cpf).first()

        if usuario:
            nova_manutencao = Manutencao(
                servico=servico,
                id_equipamento=id_equipamento,
                data=data,
                id_ocorrencia=id_ocorrencia if id_ocorrencia else None,
                id_funcionario=funcionario.matricula,
            )

            db.session.add(nova_manutencao)

            if id_ocorrencia:
                ocorrencia = Ocorrencia.query.get(id_ocorrencia)
                if ocorrencia and not ocorrencia.data_fechamento:
                    ocorrencia.data_fechamento = data

            db.session.commit()

            return redirect(url_for('funcionario.home'))
        else:
            return "Usuário não encontrado", 400

    return render_template(
        'adicionar/manutencao.html',
        nome=session['nome'],
        tipo_usuario=session['user_type'],
    )


@funcionario.route('/lista_todas', methods=['GET'])
def todas_ocorrencias():

    if 'nome' not in session:
        return redirect(url_for('funcionario.login'))

    ocorrencias = OcorrenciaProcedures.listar_todas()
    return render_template(
        'consultar/ocorrencia.html',
        ocorrencias=ocorrencias,
        nome=session.get('nome'),
        tipo_usuario='funcionario',
    )


@funcionario.route('/manutencoes', methods=['GET'])
def todas_manutencoes():
    if 'nome' not in session:
        return redirect(url_for('funcionario.login'))

    manutencoes = ManutencaoProcedures.listar_todas()
    return render_template(
        'consultar/manutencao.html',  # novo template que você adaptou
        manutencoes=manutencoes,
        nome=session.get('nome'),
        tipo_usuario='funcionario',
    )


@funcionario.route('/buscar_manutencoes', methods=['GET'])
def buscar_manutencao():
    pass


@funcionario.route('/buscar', methods=['POST'])
def buscar():

    if 'nome' not in session:
        return redirect(url_for('funcionario.login'))

    tipo_filtro = request.form.get('tipo_filtro')
    valor_filtro = request.form.get('valor_filtro', '').strip()

    if not valor_filtro:

        ocorrencias = OcorrenciaProcedures.listar_todas()
    else:

        if tipo_filtro == 'problema':
            ocorrencias = OcorrenciaProcedures.buscar_por_problema(valor_filtro)
        elif tipo_filtro == 'id':
            ocorrencias = OcorrenciaProcedures.buscar_por_id(valor_filtro)
        elif tipo_filtro == 'usuario':
            ocorrencias = OcorrenciaProcedures.buscar_por_usuario(valor_filtro)
        else:
            ocorrencias = OcorrenciaProcedures.listar_todas()

    return render_template(
        'consultar/ocorrencia.html',
        ocorrencias=ocorrencias,
        nome=session.get('nome'),
        tipo_usuario='funcionario',
    )
