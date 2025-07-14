# SCQP - Sistema de Controle de Qualidade de Patrimônio

Projeto desenvolvido como trabalho final da disciplina **Banco de Dados** na **Universidade de Brasília (UnB)** do semestre 2025.1. O SCQP é uma ferramenta estratégica que visa otimizar a gestão patrimonial de uma organização, com foco em rastreabilidade, manutenção e integridade de infraestrutura física e seus respectivos equipamentos.

## Objetivo

O sistema tem como principal objetivo fornecer uma visão **abrangente e atualizada do patrimônio** de uma instituição, integrando dados de prédios, salas, equipamentos e seus respectivos status operacionais. Ele também permite o **registro de ocorrências** e a **gestão de manutenções técnicas**, promovendo a eficiência no suporte e na operação.

## Estrutura do Projeto

O banco de dados foi modelado em três grandes grupos:

* **Estrutura Organizacional:** Prédios, Departamentos, Cursos.
* **Gestão de Usuários:** Funcionários, Docentes, Discentes.
* **Infraestrutura Técnica:** Salas, Equipamentos (com tipo e status), Ocorrências e Manutenções.

## Funcionalidades

* Cadastro e visualização de salas e equipamentos.
* Registro de ocorrências técnicas por usuários.
* Acompanhamento de manutenções.
* Visualização de equipamentos por tipo, status e localização.
* Sistema de login para diferentes perfis de usuários.
* Views e procedures diretamente no banco para facilitar relatórios e exclusões seguras.

## Tecnologias Utilizadas

* **Python + Flask** — Backend da aplicação web.
* **SQLAlchemy** — ORM para mapeamento objeto-relacional.
* **PostgreSQL** — Sistema Gerenciador de Banco de Dados.
* **HTML/CSS** — Templates da interface.
* **BRModelo** — Modelagem conceitual e lógica.

## Conteúdo Acadêmico Aplicado

* Modelagem Entidade-Relacionamento (ER).
* Conversão para modelo relacional.
* Normalização até a 3FN.
* Álgebra relacional com consultas complexas.
* Camada ORM mapeada em Python.
* Criação de **procedures** e **views** em SQL.

## Capturas de Tela

![Cadastro de Docente](docs/capturas/cadastro_docente.png)
![Manutenção](docs/capturas/manutencao.png)
![Configuração](docs/capturas/configuracao.png)
![Banco de Dados - pgAdmin](docs/capturas/bd_pgadmin.png)


## Estrutura do Código

```bash
src/
├── app.py              # Inicialização da aplicação Flask
├── config_bd.py        # Configuração do banco de dados
├── models.py           # Definição das classes do ORM
├── templates/          # HTMLs com os templates da aplicação
├── static/             # Arquivos CSS e JS
├── funcionario.py      # Blueprint do módulo de funcionários
├── docente.py          # Blueprint do módulo de docentes
├── helpers.py          # Funções auxiliares
└── procedures.py       # Procedures em SQL
```

## Execução Local

1. Clone o repositório:

   ```bash
   git clone https://github.com/brnduol/SCQP.git
   cd SCQP
   ```

2. Instale os requisitos:

   ```bash
   pip install -r requirements.txt
   ```

3. Configure seu `.env` com:

   ```env
   APP_SECRET_KEY=...
   DATABASE=postgresql://usuario:senha@localhost:5432/nome_banco
   ```

4. Rode o projeto:

   ```bash
   python src/app.py
   ```

## Equipe

## 👨‍💻 Equipe

- Bruno Eduardo dos Santos ([@brnduol](https://github.com/brnduol))
- Matheus de Melo Fellet ([@figredos](https://github.com/figredos))
- Gustavo Alencar Valadares ([@ValadaresGustavo](https://github.com/ValadaresGustavo))

## 📄 Relatório Completo

O relatório técnico com modelagens, normalizações, álgebra relacional e demais detalhes está disponível [aqui](docs/relatorio/BD-relatorio-censurado.pdf).

