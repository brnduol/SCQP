from flask import Flask, render_template, redirect, url_for, request, session
from blueprints.funcionario import funcionario
from blueprints.docente import docente
from models.models import *

app = Flask(__name__)
app.register_blueprint(funcionario, url_prefix='/funcionario')
app.register_blueprint(docente, url_prefix='/docente')


@app.route('/')
def index():
    return redirect(url_for('login'))


@app.route('/login', methods=['GET'])
def login():
    return render_template('log_forms/log_discente.html')


@app.route('/sign_up', methods=['GET'])
def sign_up():
    return render_template('log_forms/log_discente.html', sign_up=True)


# # Sign-up
# @app.route('/sign_up', methods=['GET', 'POST'])
# def sign_up():
#     if request.method == 'POST':
#         # Getting data from page
#         matricula = request.form['name']
#         password = request.form['password']

#         # Checking whether dicente is already used
#         if Dicente.verify_credentials_sign_up(matricula=matricula):
#             # Creating dicente instance
#             dicente = Dicente(matricula=matricula, password=password)

#             # Adding dicente to db
#             dicente.db.add_data(dicente)
#             dicente.db.commit_session()

#             # Adding name to session
#             session['name'] = request.form['name']

#             # Redirecting to private page
#             return redirect(url_for('notes'))

#         # Rendering home page with invalid credentials
#         return render_template(
#             'home.html',
#             invalid_credentials=True,
#             sign_up=True,
#         )

#     # Rendering home page if dicente is not logged in else returning to private page
#     return (
#         redirect(url_for('notes'))
#         if 'name' in session
#         else render_template('home.html', sign_up=True)
#     )


# # Log-in
# @app.route('/login', methods=['GET', 'POST'])
# def login():
#     if request.method == 'POST':
#         # Getting data from page
#         name: str = request.form['name']
#         password: str = request.form['password']

#         # Validating login
#         if dicente.verify_credentials_login(name=name, password=password):

#             # Adding name to session
#             session['name'] = request.form['name']

#             # Redirecting to private page
#             return redirect(url_for('notes'))

#         # Rendering home page with invalid credentials
#         return render_template('home.html', invalid_credentials=True)

#     # Rendering home page if dicente is not logged in else returning to private page
#     return (
#         redirect(url_for('notes'))
#         if 'name' in session
#         else render_template('home.html')
#     )


if __name__ == '__main__':
    app.run(debug=True)


# from flask import Flask, render_template, request, redirect
# import sqlite3
# import funcoes

# app = Flask(__name__)

# DATABASE = 'database.db'


# def get_db():
#     db = sqlite3.connect('database.db')
#     db.row_factory = sqlite3.Row
#     return db

# def init_db():
#     with app.app_context():
#         db = get_db()
#         with app.open_resource('/database/schema.sql', mode = 'r') as f:
#             db.cursor().executescript(f.read())
#         db.commit()

# @app.route('/', methods=['GET'])
# def index():
#     return render_template('index.html')

# @app.route('/ocorrencias', methods=['GET'])
# def get_ocorrencias():
#     pass

# @app.route('/manutencoes', methods=['GET'])
# def get_manutencoes():
#     pass

# @app.route('/adicionar_manutencoes', methods=['GET', "POST"])
# def add_manutencoes():
#     pass

# @app.route('/adicionar_ocorrencia', methods=['GET', "POST"])
# def add_ocorrencia():
#     return redirect('/ocorrencia')

# @app.route('/perfil/<id>', methods=['GET', "POST"])
# def perfil(id):
#     pass


# if __name__ == '__main__':
#     app.run(host='127.0.0.1', port=8000, debug=True)
