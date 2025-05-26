from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///minhabase.sqlite3'
db = SQLAlchemy(app)
app.app_context().push()


class Usuario(db.Model):
    __tablename__ = 'usuarios'

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String, unique=True)
    senha = db.Column(db.String)

    def __init__(self, nome, senha) -> None:
        super().__init__()
        self.nome = nome
        self.senha = senha


@app.route('/usuario', methods=['POST', 'GET'])
def add_usuario():
    if request.method == 'POST':
        nome = request.form['nome']
        senha = request.form['senha']
        user = Usuario(nome=nome, senha=senha)

        db.session.add(user)
        db.session.commit()

    users = Usuario.query.all()
    return render_template('usuario.html', usuarios=users)


@app.route('/')
def index():
    return 'olá mundo'


if __name__ == '__main__':
    db.create_all()
    app.run()
