from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash
import json
from flaskr.db import get_db
from src import db

bp = Blueprint('auth', __name__, url_prefix='/auth')

appetizers = Blueprint('appetizers', __name__)
