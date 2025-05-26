import os

from flask import session, render_template, request, redirect, url_for

from models import User, Note, AssistantBot, Model, app, db

UPLOAD_FOLDER = '/Users/figredos/Documents/unb/2024-1/OO/projeto_gerador-ml-model/upload'


# Onboarding
@app.route('/')
def index():
    return render_template('home.html')


# Sign-up
@app.route('/sign_up', methods=['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        name: str = request.form['name']
        password: str = request.form['password']

        if not User.verify_credentials(name=name):
            user = User(name=name, password=password)

            db.session.add(user)
            db.session.commit()

            session['name'] = request.form['name']

            return redirect(url_for('notes'))
        return render_template('home.html',
                               invalid_credentials=True,
                               sign_up=True)
    return render_template('home.html', sign_up=True)


# Log-in
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        name: str = request.form['name']
        password: str = request.form['password']

        if User.verify_credentials(name=name):
            session['name'] = request.form['name']

            return redirect(url_for('notes'))
        return render_template('home.html', invalid_credentials=True)
    return render_template('home.html')


@app.route('/logout')
def logout():
    session.pop('name', None)
    return redirect(url_for('index'))


@app.route('/notes', methods=['POST', 'GET'])
def notes():
    if 'name' in session:
        return render_template('notes.html')
    return render_template('notes.html', not_login=True)


@app.route('/new', methods=['POST', 'GET'])
def new_note():
    if 'name' in session:
        if request.method == 'POST':
            model = Model(
                name=request.form['name'],
                file=request.files['csv_file'],
            )

            bot = AssistantBot()

            bot_notes = bot.prompt(
                model_name=model.name,
                model_type=model.model_type,
                model_score=model.model_score,
            )

            note = Note(
                name=model.name,
                score=model.model_score,
                author_id=User.id,
                notes=bot_notes,
                model=model.model_file,
            )

            db.session.add(note)
            db.session.commit()
            return redirect('notes.html')
        return render_template('notes.html')  # TODO implement notes query
    return render_template('notes.html', not_login=True)


if __name__ == '__main__':
    db.create_all()
    app.run(debug=True)
