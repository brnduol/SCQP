from flask import Blueprint, render_template, redirect, url_for

docente = Blueprint(
    'docente', __name__, static_folder='static', template_folder='template'
)


@docente.route('/')
def index():
    return redirect(url_for('login'))


@docente.route('/login', methods=['GET'])
def login():
    return render_template('log_forms/log_docente.html')


@docente.route('/sign_up', methods=['GET'])
def sign_up():
    return render_template('log_forms/log_docente.html', sign_up=True)
