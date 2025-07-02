from flask import Flask, render_template, request, redirect
import sqlite3
import funcoes

app = Flask(__name__)

DATABASE = 'database.db'


def get_db():
    db = sqlite3.connect('database.db')
    db.row_factory = sqlite3.Row
    return db

def init_db():
    with app.app_context():
        db = get_db()
        with app.open_resource('/database/schema.sql', mode = 'r') as f:
            db.cursor().executescript(f.read())
        db.commit()

@app.route('/', methods=['GET'])
def index():
    return render_template('index.html')

@app.route('/ocorrencias', methods=['GET'])
def get_ocorrencias():
    pass

@app.route('/manutencoes', methods=['GET'])
def get_manutencoes():
    pass

@app.route('/adicionar_manutencoes', methods=['GET', "POST"])
def add_manutencoes():
    pass

@app.route('/adicionar_ocorrencia', methods=['GET', "POST"])
def add_ocorrencia():
    return redirect('/ocorrencia')

@app.route('/perfil/<id>', methods=['GET', "POST"])
def perfil(id):
    pass



if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8000, debug=True)
 