import unicodedata
from flask import session

from models import *


def clean_string(string):
    clean_str = (
        unicodedata.normalize('NFKD', string).encode('ascii', 'ignore').decode('ascii')
    ).lower()

    return clean_str


def get_user(cpf, type_usr):
    if type_usr == 'discente':
        return Discente.query.filter_by(cpf=cpf).first()
    elif type_usr == 'docente':
        return Docente.query.filter_by(cpf=cpf).first()
    elif type_usr == 'funcionario':
        return Funcionario.query.filter_by(cpf=cpf).first()
    return None


def verify_credentials_sign_up(cpf):
    user = Usuario.query.filter_by(cpf=cpf).first()

    if user:
        return False

    return True


def verify_credentials_login(email, senha, type_usr):
    user = Usuario.query.filter_by(email=email, senha=senha).first()
    if user:
        cpf = user.cpf  # type: ignore

        specific_user = get_user(cpf, type_usr)

        if user and specific_user:
            return user

    return False


def get_ocorrencias(termo_busca=None):

    id_usuario = session['id']
    print(id_usuario)
    query = Ocorrencia.query.filter_by(id_usuario=id_usuario)

    if termo_busca:
        query = query.filter(Ocorrencia.problema.ilike(f"%{termo_busca}%"))

    return query.all()
