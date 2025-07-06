from app import app, db
from models import *
from datetime import date

def seed_database():
    with app.app_context():
        db.drop_all()
        db.create_all()  # garante que as tabelas existem

        if Departamento.query.first():
            print("⚠️ Dados já existem. Abortando.")
            return

        print("🌱 Populando banco...")

        d = Departamento(nome="cic")
        db.session.add(d)
        db.session.commit()

        c1 = Curso(nome="teste", id_departamento=d.id)
        c2 = Curso(nome="Sistemas de Informação", id_departamento=d.id)
        db.session.add_all([c1, c2])
        db.session.commit()

        print("✅ Seed finalizado com sucesso!")

if __name__ == "__main__":
    print("🚀 Rodando seed.py...")
    seed_database()