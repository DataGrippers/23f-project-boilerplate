from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

menu = Blueprint('menu', __name__)

@menu.route('/menu/<id>', methods=['GET'])
def get_menut_detail (id):
    query = 'SELECT menuID FROM menu' + str(id)
    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)    
