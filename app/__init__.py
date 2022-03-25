from api import settings

settings.init()

from flask import Flask
import os

os.environ['FLASK_APP'] = 'webservice.py'

settings.app = Flask(__name__)

from api.routes import *
