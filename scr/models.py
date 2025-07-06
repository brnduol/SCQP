from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# ==========================
# ORGANIZATIONAL STRUCTURE
# ==========================


class Predio(db.Model):
    __tablename__ = 'Predio'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nome = db.Column(db.String(100))
    local = db.Column(db.String(100))
    departamentos = db.relationship(
        'Departamento', backref='predio', cascade='all, delete'
    )
    salas = db.relationship('Sala', backref='predio', cascade='all, delete')


class Departamento(db.Model):
    __tablename__ = 'Departamento'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nome = db.Column(db.String(100))
    id_predio = db.Column(db.Integer, db.ForeignKey('Predio.id', ondelete='CASCADE'))
    cursos = db.relationship('Curso', backref='departamento', cascade='all, delete')
    docentes = db.relationship('Docente', backref='departamento', cascade='all, delete')


class Curso(db.Model):
    __tablename__ = 'Curso'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nome = db.Column(db.String(100))
    id_departamento = db.Column(
        db.Integer, db.ForeignKey('Departamento.id', ondelete='CASCADE')
    )
    discentes = db.relationship('Discente', backref='curso', cascade='all, delete')


# ==========================
# USERS
# ==========================


class Usuario(db.Model):
    __tablename__ = 'Usuario'
    cpf = db.Column(db.BigInteger, primary_key=True)
    nome = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), unique=True)
    senha = db.Column(db.String(100), nullable=False)
    funcionario = db.relationship(
        'Funcionario', backref='usuario', uselist=False, cascade='all, delete'
    )
    docente = db.relationship(
        'Docente', backref='usuario', uselist=False, cascade='all, delete'
    )
    discente = db.relationship(
        'Discente', backref='usuario', uselist=False, cascade='all, delete'
    )
    ocorrencias = db.relationship(
        'Ocorrencia', backref='usuario', cascade='all, delete'
    )


class Funcionario(db.Model):
    __tablename__ = 'Funcionario'
    matricula = db.Column(db.Integer, primary_key=True)
    cpf = db.Column(db.BigInteger, db.ForeignKey('Usuario.cpf', ondelete='CASCADE'))


class Docente(db.Model):
    __tablename__ = 'Docente'
    matricula = db.Column(db.Integer, primary_key=True)
    cpf = db.Column(
        db.BigInteger,
        db.ForeignKey('Usuario.cpf', ondelete='CASCADE'),
        unique=True,
        nullable=False,
    )
    id_departamento = db.Column(
        db.Integer, db.ForeignKey('Departamento.id', ondelete='CASCADE'), nullable=False
    )


class Discente(db.Model):
    __tablename__ = 'Discente'
    matricula = db.Column(db.Integer, primary_key=True)
    data_de_inicio = db.Column(db.Date, nullable=False)
    data_de_termino = db.Column(db.Date)
    id_curso = db.Column(db.Integer, db.ForeignKey('Curso.id', ondelete='CASCADE'))
    cpf = db.Column(
        db.BigInteger, db.ForeignKey('Usuario.cpf', ondelete='CASCADE'), nullable=False
    )


# ==========================
# INFRASTRUCTURE
# ==========================


class Sala(db.Model):
    __tablename__ = 'Sala'
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(100))
    id_predio = db.Column(db.Integer, db.ForeignKey('Predio.id', ondelete='CASCADE'))
    equipamentos = db.relationship('Equipamento', backref='sala', cascade='all, delete')


class TipoEquipamento(db.Model):
    __tablename__ = 'TipoEquipamento'
    id = db.Column(db.Integer, primary_key=True)
    descricao = db.Column(db.String(100))
    equipamentos = db.relationship('Equipamento', backref='tipo', cascade='all, delete')


class StatusEquipamento(db.Model):
    __tablename__ = 'StatusEquipamento'
    id = db.Column(db.Integer, primary_key=True)
    descricao = db.Column(db.String(100))
    equipamentos = db.relationship(
        'Equipamento', backref='status', cascade='all, delete'
    )


class Equipamento(db.Model):
    __tablename__ = 'Equipamento'
    id = db.Column(db.Integer, primary_key=True)
    data_aquisicao = db.Column(db.Date)
    fabricante = db.Column(db.String(100))
    foto_binaria = db.Column(db.LargeBinary)
    id_tipo = db.Column(
        db.Integer, db.ForeignKey('TipoEquipamento.id', ondelete='CASCADE')
    )
    id_status = db.Column(
        db.Integer, db.ForeignKey('StatusEquipamento.id', ondelete='CASCADE')
    )
    id_sala = db.Column(db.Integer, db.ForeignKey('Sala.id', ondelete='CASCADE'))
    manutencoes = db.relationship(
        'Manutencao', backref='equipamento', cascade='all, delete'
    )


# ==========================
# OCCURRENCES & MAINTENANCE
# ==========================


class Ocorrencia(db.Model):
    __tablename__ = 'Ocorrencia'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    problema = db.Column(db.String(255))
    data_abertura = db.Column(db.Date)
    data_fechamento = db.Column(db.Date)
    id_usuario = db.Column(
        db.BigInteger, db.ForeignKey('Usuario.cpf', ondelete='CASCADE'), nullable=False
    )
    manutencoes = db.relationship(
        'Manutencao', backref='ocorrencia', cascade='all, delete'
    )


class Manutencao(db.Model):
    __tablename__ = 'Manutencao'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    servico = db.Column(db.String(255))
    data = db.Column(db.Date)
    id_equipamento = db.Column(
        db.Integer, db.ForeignKey('Equipamento.id', ondelete='CASCADE')
    )
    id_ocorrencia = db.Column(
        db.Integer, db.ForeignKey('Ocorrencia.id', ondelete='CASCADE')
    )
    id_funcionario = db.Column(
        db.Integer, db.ForeignKey('Funcionario.matricula', ondelete='CASCADE')
    )
