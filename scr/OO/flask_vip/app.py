from flask import Flask, session, redirect, url_for, request, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///minhabase.sqlite3'
db = SQLAlchemy(app)
app.secret_key = '123456'
app.app_context().push()
    
class Usuario(db.Model):
    __tablename__ = 'usuarios'

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String)
    senha = db.Column(db.String)

    def __init__(self, nome, senha) -> None:
        super().__init__()
        self.nome = nome
        self.senha = senha
        
    @staticmethod
    def verificar_credenciais(nome:str = None, senha:str = None, sign_up: bool=False) -> bool:
        if nome and senha:
            if Usuario.query.filter_by(nome=nome).first():
                return False if sign_up else True 
        return False
    
@app.route('/')
def index():
    return 'Bem vindo'

@app.route('/area_vip')
def area_vip():
    if 'nome' in session:
        return f'Você está na área vip, logado como {session['nome']}'
    return 'Você não está autorizado para ver essa página. Por favor, faça login'

@app.route('/sign_up', methods=['POST', 'GET'])
def sign_up():
    if request.method == 'POST':
        nome = request.form['nome']
        senha = request.form['senha']
        
        if not Usuario.verificar_credenciais(nome=nome, senha=senha, sign_up=True):
            
            user = Usuario(nome=nome, senha=senha)
        
            db.session.add(user)
            db.session.commit()
            
            session['nome'] = request.form['nome']
            return redirect(url_for('area_vip'))
        return render_template('formulario.html', invalid_credentials=True, sign_up=True)
    return render_template('formulario.html', sign_up=True)
        
    

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        nome = request.form['nome']
        senha = request.form['senha']
        
        if Usuario.verificar_credenciais(nome, senha):
            session['nome'] = request.form['nome']
            
            return redirect(url_for('area_vip'))
        return render_template('formulario.html', invalid_credentials=True)
    return render_template('formulario.html')
    
    
@app.route('/logout')
def logout():
    session.pop('nome', None)
    return redirect(url_for('index'))

if __name__ == '__main__':
    db.create_all()
    app.run(debug=True)
            