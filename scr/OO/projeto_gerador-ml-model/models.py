# Utilities
import os
from typing import Self
from dotenv import load_dotenv
from typing import Union, Type

# ML model creation
import pickle
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split

# ML models
from sklearn.naive_bayes import CategoricalNB
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import LinearSVC, LinearSVR, SVC
from sklearn.ensemble import RandomForestClassifier, RandomForestRegressor
from sklearn.linear_model import SGDClassifier, SGDRegressor, ElasticNet, Lasso, Ridge

# Flask application
from flask import Flask
from openai import OpenAI
from flask_sqlalchemy import SQLAlchemy

# Loading .env file
load_dotenv()

# Creating flask app
app = Flask(__name__)

# Setting database up
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///custom_ml_model.sqlite3'
db = SQLAlchemy(app)

# Flask app settings
app.secret_key = os.getenv('APP_SECRET_KEY')
app.app_context().push()

# Creating OpenAI client
client = OpenAI(api_key=os.getenv('OPEN_AI_KEY'))


# User class
class User(db.Model):
    __tablename__ = 'users'

    id: int = db.Column(db.Integer, primary_key=True)
    name: str = db.Column(db.String, unique=True)
    password: str = db.Column(db.String)

    def __init__(self, name: str, password: str) -> None:
        super().__init__()
        self.name: str = name
        self.password: str = password

    @staticmethod
    def verify_credentials(name: str = None) -> bool:
        if User.query.filter_by(name=name).first():
            return True
        return False


class Note(db.Model):
    __tablename__ = 'notes'

    id: int = db.Column(db.Integer, primary_key=True)
    name: str = db.Column(db.String)
    author_id: int = db.Column(db.Integer)
    notes: str = db.Column(db.String)
    model: bytes = db.Column(db.LargeBinary)

    def __init__(
        self,
        name: str,
        author_id: int,
        notes,
        score,
        model,
    ) -> None:
        super().__init__()
        self.name = name
        self.model_score = score
        self.author_id = author_id
        self.notes = notes
        self.model_file = model


# Model class
class Model:

    def __init__(self, name: str, file) -> None:
        super().__init__()
        self.name = name
        self.file = file
        self.model_score: int = 0
        self.data_frame: pd.DataFrame
        self.model_file: bytes
        self.models = {
            'regression': [
                SGDRegressor, Lasso, ElasticNet, Ridge, LinearSVR,
                RandomForestRegressor
            ],
            'classifier': [
                SGDClassifier, LinearSVC, KNeighborsClassifier,
                RandomForestClassifier, CategoricalNB, SVC
            ],
        }
        self.model_type

    def read_file(self) -> None:
        csv_file = self.file.read()
        self.data_frame = pd.read_csv(
            csv_file
        )  # TODO validate file data (if there are null values, if there is a 'target' column)

    def fit_data(self) -> list:
        # Separating data into features and target
        X: pd.DataFrame = self.data_frame.drop('target', axis=1)
        y: pd.Series = self.data_frame['target']

        # Separating data into training and testing sets
        return train_test_split(X=X, y=y, test_size=0.2)

    def model_scoring(self, model_type: str) -> None:
        # Getting training and test sets
        X_train, X_test, y_train, y_test = self.fit_data()

        # Setting an initial model
        self.model_type = self.models[model_type][0]

        # Iterating over models
        for i in self.models[model_type]:
            # Creating models and fitting them
            model = self.models[i]()
            model.fit(X_train, y_train)
            score = model.score(X_test, y_test)

            if self.model_score < score:  # TODO log of what it's doing
                self.model_score = score
                self.model_type = self.models[i]

    def save_model(self) -> None:
        # Saving model
        self.model_file = pickle.dumps(
            self.model_type,
            open(
                f'/Users/figredos/Documents/unb/2024-1/OO/projeto_gerador-ml-model/models{self.name}.pkl',
                'wb',
            ),
        )

    def model_selection(self) -> None:
        # Finding information on the data
        dimensions: int = self.data_frame.len()
        target_unique: int = len(self.data_frame['target'].unique())

        # Choosing between classification and regression
        model_type: str = 'regression' if dimensions / target_unique <= 5 * np.sqrt(
            dimensions) else 'classifier'

        # Scoring models to find ideal one
        self.model_scoring(model_type=model_type)

        # Saving model
        self.save_model()

    def create_model(self):
        df = ValidateCSV(file=self.file)

        self.data_frame = df.validate

        self.model_selection()


# Assistant bot class
class AssistantBot:
    __instance = None

    def __new__(cls) -> Self:
        if not AssistantBot.__instance:
            AssistantBot.__instance = super().__new__(cls)
        return AssistantBot.__instance

    def __init__(self) -> None:
        self.__model: str = 'gpt-3.5-turbo-0125'
        self.__response_format: dict[str, str] = {'type': 'text'}

    def prompt(self, model_name: str, model_type: str,
               model_score: float) -> str:
        response = client.chat.completions.create(
            model=self.__model,
            response_format=self.__response_format,
            messages=[
                {
                    'role':
                    'system',
                    'content':
                    f'Com base no tipo do modelo, no score e no objetivo, gere insights sobre o que o modelo de machine learning faz'
                },
                {
                    'role':
                    'user',
                    'content':
                    f'O nome do modelo é {model_name}, o tipo do modelo de Machine Learning usado foi {model_type} e seu score em cima dos dados foi de {model_score}'
                },
            ],
        )
        return response.choices[0].message.content


class ValidateCSV(object):

    def __init__(self, file):
        self.file = file

    @property
    def validate(self) -> pd.DataFrame:
        if not self.file.filename.endswith(".csv"):
            raise ValueError("Invalid file format. Please provide a CSV file.")

        try:
            csv_file = self.file.read()
            df = pd.read_csv(csv_file)
            df.dropna(inplace=True)
            if 'target' not in df.columns:
                raise ValueError("CSV is missing a column named 'target'.")
            return df
        except FileNotFoundError:
            raise ValueError("File not found at the provided path.")
