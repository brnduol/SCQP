from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# ==========================
# ORGANIZATIONAL STRUCTURE
# ==========================


class Predio(db.Model):
    __tablename__ = 'predio'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nome = db.Column(db.String(100))
    local = db.Column(db.String(100))
    departamentos = db.relationship(
        'Departamento', backref='predio', cascade='all, delete'
    )
    salas = db.relationship('Sala', backref='predio', cascade='all, delete')


class Departamento(db.Model):
    __tablename__ = 'departamento'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nome = db.Column(db.String(100))
    id_predio = db.Column(db.Integer, db.ForeignKey('predio.id', ondelete='CASCADE'))
    cursos = db.relationship('Curso', backref='departamento', cascade='all, delete')
    docentes = db.relationship('Docente', backref='departamento', cascade='all, delete')


class Curso(db.Model):
    __tablename__ = 'curso'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nome = db.Column(db.String(100))
    id_departamento = db.Column(
        db.Integer, db.ForeignKey('departamento.id', ondelete='CASCADE')
    )
    discentes = db.relationship('Discente', backref='curso', cascade='all, delete')


# ==========================
# USERS
# ==========================


class Usuario(db.Model):
    __tablename__ = 'usuario'
    cpf = db.Column(db.String(100), primary_key=True)
    nome = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), unique=True)
    senha = db.Column(db.String(100), nullable=False)
    foto_binaria = db.Column(db.LargeBinary)
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
    __tablename__ = 'funcionario'
    matricula = db.Column(db.String(100), primary_key=True)
    cpf = db.Column(
        db.String(100), db.ForeignKey('usuario.cpf', ondelete='CASCADE'), nullable=False
    )


class Docente(db.Model):
    __tablename__ = 'docente'
    matricula = db.Column(db.String(100), primary_key=True)
    cpf = db.Column(
        db.String(100),
        db.ForeignKey('usuario.cpf', ondelete='CASCADE'),
        unique=True,
        nullable=False,
    )
    id_departamento = db.Column(
        db.Integer, db.ForeignKey('departamento.id', ondelete='CASCADE'), nullable=False
    )


class Discente(db.Model):
    __tablename__ = 'discente'
    matricula = db.Column(db.String(100), primary_key=True)
    data_de_inicio = db.Column(db.Date, nullable=False)
    data_de_termino = db.Column(db.Date)
    id_curso = db.Column(db.Integer, db.ForeignKey('curso.id', ondelete='CASCADE'))
    cpf = db.Column(
        db.String(100), db.ForeignKey('usuario.cpf', ondelete='CASCADE'), nullable=False
    )


# ==========================
# INFRASTRUCTURE
# ==========================


class Sala(db.Model):
    __tablename__ = 'sala'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nome = db.Column(db.String(100))
    id_predio = db.Column(db.Integer, db.ForeignKey('predio.id', ondelete='CASCADE'))
    equipamentos = db.relationship('Equipamento', backref='sala', cascade='all, delete')


class TipoEquipamento(db.Model):
    __tablename__ = 'tipoequipamento'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    descricao = db.Column(db.String(100))
    equipamentos = db.relationship('Equipamento', backref='tipo', cascade='all, delete')


class StatusEquipamento(db.Model):
    __tablename__ = 'statusequipamento'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    descricao = db.Column(db.String(100))
    equipamentos = db.relationship(
        'Equipamento', backref='status', cascade='all, delete'
    )


class Equipamento(db.Model):
    __tablename__ = 'equipamento'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    data_aquisicao = db.Column(db.Date)
    fabricante = db.Column(db.String(100))
    id_tipo = db.Column(
        db.Integer, db.ForeignKey('tipoequipamento.id', ondelete='CASCADE')
    )
    id_status = db.Column(
        db.Integer, db.ForeignKey('statusequipamento.id', ondelete='CASCADE')
    )
    id_sala = db.Column(db.Integer, db.ForeignKey('sala.id', ondelete='CASCADE'))
    manutencoes = db.relationship(
        'Manutencao', backref='equipamento', cascade='all, delete'
    )


# ==========================
# OCCURRENCES & MAINTENANCE
# ==========================


class Ocorrencia(db.Model):
    __tablename__ = 'ocorrencia'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    problema = db.Column(db.String(255))
    data_abertura = db.Column(db.Date)
    data_fechamento = db.Column(db.Date)
    id_usuario = db.Column(
        db.String(100), db.ForeignKey('usuario.cpf', ondelete='CASCADE'), nullable=False
    )
    manutencoes = db.relationship(
        'Manutencao', backref='ocorrencia', cascade='all, delete'
    )


class Manutencao(db.Model):
    __tablename__ = 'manutencao'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    servico = db.Column(db.String(255))
    data = db.Column(db.Date)
    id_equipamento = db.Column(
        db.Integer, db.ForeignKey('equipamento.id', ondelete='CASCADE')
    )
    id_ocorrencia = db.Column(
        db.Integer, db.ForeignKey('ocorrencia.id', ondelete='CASCADE')
    )
    id_funcionario = db.Column(
        db.String(100), db.ForeignKey('funcionario.matricula', ondelete='CASCADE')
    )
