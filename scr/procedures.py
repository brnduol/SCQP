from models import *
from datetime import date
from sqlalchemy.orm import aliased


class OcorrenciaProcedures:

    @staticmethod
    def buscar_por_problema(problema):
        from app import db

        """
        Procedure 1: Buscar ocorrências pelo problema
        """
        try:
            return (
                db.session.query(
                    Ocorrencia.id,
                    Ocorrencia.problema,
                    Ocorrencia.data_abertura,
                    Ocorrencia.data_fechamento,
                    Usuario.nome.label('nome_usuario'),
                )
                .join(Usuario, Ocorrencia.id_usuario == Usuario.cpf)
                .filter(Ocorrencia.problema.ilike(f'%{problema}%'))
                .order_by(Ocorrencia.data_abertura.desc())
                .all()
            )
        except Exception as e:
            print(f"Erro ao buscar por problema: {e}")
            return []

    @staticmethod
    def buscar_por_id(id_ocorrencia):
        from app import db

        """
        Procedure 2: Buscar ocorrências pelo ID
        """
        try:
            return (
                db.session.query(
                    Ocorrencia.id,
                    Ocorrencia.problema,
                    Ocorrencia.data_abertura,
                    Ocorrencia.data_fechamento,
                    Usuario.nome.label('nome_usuario'),
                )
                .join(Usuario, Ocorrencia.id_usuario == Usuario.cpf)
                .filter(Ocorrencia.id == int(id_ocorrencia))
                .order_by(Ocorrencia.data_abertura.desc())
                .all()
            )
        except (ValueError, Exception) as e:
            print(f"Erro ao buscar por ID: {e}")
            return []

    @staticmethod
    def buscar_por_usuario(nome_usuario):
        from app import db

        """
        Procedure 3: Buscar ocorrências pelo nome do usuário
        """
        try:
            return (
                db.session.query(
                    Ocorrencia.id,
                    Ocorrencia.problema,
                    Ocorrencia.data_abertura,
                    Ocorrencia.data_fechamento,
                    Usuario.nome.label('nome_usuario'),
                )
                .join(Usuario, Ocorrencia.id_usuario == Usuario.cpf)
                .filter(Usuario.nome.ilike(f'%{nome_usuario}%'))
                .order_by(Ocorrencia.data_abertura.desc())
                .all()
            )
        except Exception as e:
            print(f"Erro ao buscar por usuário: {e}")
            return []

    @staticmethod
    def listar_todas():
        from app import db

        """
        Procedure 4: Listar todas as ocorrências (sem filtro)
        """
        try:
            return (
                db.session.query(
                    Ocorrencia.id,
                    Ocorrencia.problema,
                    Ocorrencia.data_abertura,
                    Ocorrencia.data_fechamento,
                    Usuario.nome.label('nome_usuario'),
                )
                .join(Usuario, Ocorrencia.id_usuario == Usuario.cpf)
                .order_by(Ocorrencia.data_abertura.desc())
                .all()
            )
        except Exception as e:
            print(f"Erro ao listar todas as ocorrências: {e}")
            return []

    @staticmethod
    def listar_por_usuario_logado(id_usuario, termo_busca=None):
        from app import db

        """
        Procedure 5: Listar ocorrências apenas do usuário logado, com filtro opcional
        """
        try:
            query = (
                db.session.query(
                    Ocorrencia.id,
                    Ocorrencia.problema,
                    Ocorrencia.data_abertura,
                    Ocorrencia.data_fechamento,
                    Usuario.nome.label('nome_usuario'),
                )
                .join(Usuario, Ocorrencia.id_usuario == Usuario.cpf)
                .filter(Ocorrencia.id_usuario == id_usuario)
            )

            if termo_busca:
                query = query.filter(Ocorrencia.problema.ilike(f'%{termo_busca}%'))

            return query.order_by(Ocorrencia.data_abertura.desc()).all()

        except Exception as e:
            print(f"Erro ao listar ocorrências do usuário logado: {e}")
            return []

    @staticmethod
    def excluir_por_id(id_ocorrencia):
        from app import db

        """
        Procedure 6: Excluir ocorrência pelo ID
        """
        try:
            ocorrencia = db.session.query(Ocorrencia).get(int(id_ocorrencia))
            if ocorrencia:
                db.session.delete(ocorrencia)
                db.session.commit()
                return True  # sucesso
            else:
                print(f"Ocorrência com ID {id_ocorrencia} não encontrada.")
                return False  # não encontrada
        except Exception as e:
            db.session.rollback()  # desfaz qualquer mudança se houver erro
            print(f"Erro ao excluir ocorrência: {e}")
            return False

    @staticmethod
    def editar_por_id(id_ocorrencia, nova_descricao):
        from app import db

        try:
            ocorrencia = db.session.query(Ocorrencia).get(int(id_ocorrencia))
            if ocorrencia:
                ocorrencia.problema = (
                    nova_descricao  # Atualize os campos desejados aqui
                )
                db.session.commit()
                return True
            else:
                return False  # Ocorrência não encontrada
        except Exception as e:
            db.session.rollback()
            print(f"Erro ao editar ocorrência: {e}")
            return False


class EquipamentoProcedures:

    @staticmethod
    def adicionar_equipamento(
        id, data_aquisicao, fabricante, id_tipo, id_status, id_sala, foto_binaria=None
    ):
        equipamento = Equipamento(
            id=id,
            data_aquisicao=data_aquisicao,
            fabricante=fabricante,
            id_tipo=id_tipo,
            id_status=id_status,
            id_sala=id_sala,
            foto_binaria=foto_binaria,
        )
        db.session.add(equipamento)
        db.session.commit()
        return equipamento

    @staticmethod
    def buscar_por_id(id_equipamento):
        return Equipamento.query.get(id_equipamento)

    @staticmethod
    def listar_todos():
        return Equipamento.query.order_by(Equipamento.id).all()

    @staticmethod
    def atualizar_status(id_equipamento, novo_status_id):
        equipamento = Equipamento.query.get(id_equipamento)
        if equipamento:
            equipamento.id_status = novo_status_id
            db.session.commit()
        return equipamento

    @staticmethod
    def atualizar_fabricante(id_equipamento, novo_fabricante):
        equipamento = Equipamento.query.get(id_equipamento)
        if equipamento:
            equipamento.fabricante = novo_fabricante
            db.session.commit()
        return equipamento

    @staticmethod
    def deletar_equipamento(id_equipamento):
        equipamento = Equipamento.query.get(id_equipamento)
        if equipamento:
            db.session.delete(equipamento)
            db.session.commit()
            return True
        return False

    @staticmethod
    def listar_por_sala(id_sala):
        return Equipamento.query.filter_by(id_sala=id_sala).all()

    @staticmethod
    def listar_por_status(id_status):
        return Equipamento.query.filter_by(id_status=id_status).all()

    @staticmethod
    def listar_por_tipo(id_tipo):
        return Equipamento.query.filter_by(id_tipo=id_tipo).all()


class ManutencaoProcedures:

    @staticmethod
    def registrar_manutencao(servico, id_equipamento, id_ocorrencia, id_funcionario):
        manutencao = Manutencao(
            servico=servico,
            data=date.today(),
            id_equipamento=id_equipamento,
            id_ocorrencia=id_ocorrencia,
            id_funcionario=id_funcionario,
        )
        db.session.add(manutencao)
        db.session.commit()
        return manutencao

    @staticmethod
    def buscar_por_id(id):
        return Manutencao.query.get(id)

    @staticmethod
    def listar_todas():
        UsuarioFuncionario = aliased(Usuario)
        UsuarioSolicitante = aliased(Usuario)

        return (
            db.session.query(
                Manutencao.id,
                Manutencao.servico,
                Manutencao.data,
                Manutencao.id_ocorrencia,
                Manutencao.id_equipamento,
                Equipamento.fabricante.label('nome'),
                UsuarioFuncionario.nome.label('nome_funcionario'),
                UsuarioSolicitante.nome.label('nome_solicitante'),
            )
            .join(Equipamento, Manutencao.id_equipamento == Equipamento.id)
            .join(Funcionario, Manutencao.id_funcionario == Funcionario.matricula)
            .join(UsuarioFuncionario, UsuarioFuncionario.cpf == Funcionario.cpf)
            .join(Ocorrencia, Ocorrencia.id == Manutencao.id_ocorrencia)
            .join(UsuarioSolicitante, UsuarioSolicitante.cpf == Ocorrencia.id_usuario)
            .order_by(Manutencao.data.desc())
            .all()
        )

    @staticmethod
    def listar_por_equipamento(id_equipamento):
        return Manutencao.query.filter_by(id_equipamento=id_equipamento).all()

    @staticmethod
    def listar_por_ocorrencia(id_ocorrencia):
        return Manutencao.query.filter_by(id_ocorrencia=id_ocorrencia).all()

    @staticmethod
    def listar_por_funcionario(id_funcionario):
        return Manutencao.query.filter_by(id_funcionario=id_funcionario).all()

    @staticmethod
    def atualizar_servico(id, novo_servico):
        manutencao = Manutencao.query.get(id)
        if manutencao:
            manutencao.servico = novo_servico
            db.session.commit()
        return manutencao

    @staticmethod
    def deletar_manutencao(id):
        manutencao = Manutencao.query.get(id)
        if manutencao:
            db.session.delete(manutencao)
            db.session.commit()
            return True
        return False
