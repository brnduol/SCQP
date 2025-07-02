from flask import Blueprint, render_template, redirect, url_for

funcionario = Blueprint(
    'funcionario', __name__, static_folder='static', template_folder='template'
)


@funcionario.route('/')
def index():
    return redirect(url_for('login'))


@funcionario.route('/login', methods=['GET'])
def login():
    return render_template('log_forms/log_funcionario.html')


@funcionario.route('/sign_up', methods=['GET'])
def sign_up():
    return render_template('log_forms/log_funcionario.html', sign_up=True)
