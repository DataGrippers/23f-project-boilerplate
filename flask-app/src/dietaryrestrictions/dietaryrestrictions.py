# john

from flask import Blueprint, request, jsonify, current_app
import json
from src import db

dietary_restrictions = Blueprint('dietary_restrictions', __name__)

# Get all dietary restrictions from the database
@dietary_restrictions.route('/dietary_restrictions', methods=['GET'])
def get_dietary_restrictions():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT dietaryID, nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool FROM dietary_restrictions')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get dietary restrictions for a specific user
@dietary_restrictions.route('/dietary_restrictions/<int:userID>', methods=['GET'])
def get_dietary_restrictions_for_user(userID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT dietaryID, nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool FROM dietary_restrictions WHERE userID = %s', (userID,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Add a new dietary restriction
@dietary_restrictions.route('/dietary_restrictions', methods=['POST'])
def add_dietary_restriction():
    data = request.json
    current_app.logger.info(data)
    if 'nuts_bool' not in data or 'vegetarian_bool' not in data or 'gluten_bool' not in data or 'eggs_bool' not in data or 'dairy_bool' not in data:
        return jsonify({'error': 'Missing required fields'}), 400
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (%s, %s, %s, %s, %s)',
                   (data['nuts_bool'], data['vegetarian_bool'], data['gluten_bool'], data['eggs_bool'], data['dairy_bool']))
    db.get_db().commit()
    return jsonify({"message": "Dietary restriction added successfully"}), 201

# Update a dietary restriction
@dietary_restrictions.route('/dietary_restrictions/<int:dietaryID>', methods=['PUT'])
def update_dietary_restriction(dietaryID):
    data = request.json
    current_app.logger.info(data)
    if 'nuts_bool' not in data or 'vegetarian_bool' not in data or 'gluten_bool' not in data or 'eggs_bool' not in data or 'dairy_bool' not in data:
        return jsonify({'error': 'Missing required fields'}), 400
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE dietary_restrictions SET nuts_bool = %s, vegetarian_bool = %s, gluten_bool = %s, eggs_bool = %s, dairy_bool = %s WHERE dietaryID = %s',
                   (data['nuts_bool'], data['vegetarian_bool'], data['gluten_bool'], data['eggs_bool'], data['dairy_bool'], dietaryID))
    db.get_db().commit()
    return jsonify({"message": "Dietary restriction updated successfully"}), 200