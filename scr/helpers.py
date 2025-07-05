import unicodedata

from models import Usuario, Discente, Docente, Funcionario, Ocorrencia
from app import db


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


# Adicione esta classe ao seu arquivo helpers.py

class OcorrenciaProcedures:
    
    @staticmethod
    def buscar_por_problema(problema):
        """
        Procedure 1: Buscar ocorrências pelo problema
        """
        try:
            return db.session.query(
                Ocorrencia.id,
                Ocorrencia.problema,
                Ocorrencia.data_abertura,
                Ocorrencia.data_fechamento,
                Usuario.nome.label('nome_usuario')
            ).join(Usuario, Ocorrencia.id_usuario == Usuario.cpf)\
             .filter(Ocorrencia.problema.ilike(f'%{problema}%'))\
             .order_by(Ocorrencia.data_abertura.desc())\
             .all()
        except Exception as e:
            print(f"Erro ao buscar por problema: {e}")
            return []
    
    @staticmethod
    def buscar_por_id(id_ocorrencia):
        """
        Procedure 2: Buscar ocorrências pelo ID
        """
        try:
            return db.session.query(
                Ocorrencia.id,
                Ocorrencia.problema,
                Ocorrencia.data_abertura,
                Ocorrencia.data_fechamento,
                Usuario.nome.label('nome_usuario')
            ).join(Usuario, Ocorrencia.id_usuario == Usuario.cpf)\
             .filter(Ocorrencia.id == int(id_ocorrencia))\
             .order_by(Ocorrencia.data_abertura.desc())\
             .all()
        except (ValueError, Exception) as e:
            print(f"Erro ao buscar por ID: {e}")
            return []
    
    @staticmethod
    def buscar_por_usuario(nome_usuario):
        """
        Procedure 3: Buscar ocorrências pelo nome do usuário
        """
        try:
            return db.session.query(
                Ocorrencia.id,
                Ocorrencia.problema,
                Ocorrencia.data_abertura,
                Ocorrencia.data_fechamento,
                Usuario.nome.label('nome_usuario')
            ).join(Usuario, Ocorrencia.id_usuario == Usuario.cpf)\
             .filter(Usuario.nome.ilike(f'%{nome_usuario}%'))\
             .order_by(Ocorrencia.data_abertura.desc())\
             .all()
        except Exception as e:
            print(f"Erro ao buscar por usuário: {e}")
            return []
    
    @staticmethod
    def listar_todas():
        """
        Procedure 4: Listar todas as ocorrências (sem filtro)
        """
        try:
            return db.session.query(
                Ocorrencia.id,
                Ocorrencia.problema,
                Ocorrencia.data_abertura,
                Ocorrencia.data_fechamento,
                Usuario.nome.label('nome_usuario')
            ).join(Usuario, Ocorrencia.id_usuario == Usuario.cpf)\
             .order_by(Ocorrencia.data_abertura.desc())\
             .all()
        except Exception as e:
            print(f"Erro ao listar todas as ocorrências: {e}")
            return []