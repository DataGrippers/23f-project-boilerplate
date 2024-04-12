# annie

from flask import Blueprint, request, jsonify, make_response
import json
from src import db

location = Blueprint('location', __name__)

# Get the number of restaurants in all locations
@location.route('/location', methods=['GET'])
def get_number():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT num_restaurants FROM location')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get number of restaurants for particular location ID
@location.route('/location/<location_id>', methods=['GET'])
def get_number(location_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT num_restaurants FROM location WHERE locationId = %s', (location_id,))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get number of restaurants for particular zipcode
@location.route('/location/<zip_code>', methods=['GET'])
def get_number_zipcode(zip_code):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT num_restaurants FROM location WHERE zipcode = %s', (zip_code,))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


# Update location information
@location.route('/location/<location_id>', methods=['PUT'])
def update_location(location_id):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE location SET city_name=%s, num_restaurants=%s, zipcode=%s WHERE locationId=%s',
                   (data['city_name'], data['num_restaurants'], data['zipcode'], location_id))
    db.get_db().commit()
    return jsonify({'message': 'Location information updated successfully'}), 200

# Delete location
@location.route('/location/<location_id>', methods=['DELETE'])
def delete_location(location_id):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM location WHERE locationId = %s', (location_id,))
    db.get_db().commit()
    return jsonify({'message': 'Location deleted successfully'}), 200


@location.route('/location', methods=['POST'])
def add_location():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute(
        'INSERT INTO location (city_name, num_restaurants, zipcode) VALUES (%s, %s, %s)',
        (
            data['city_name'],
            data['num_restaurants'],
            data['zipcode']
        )
    )
    db.get_db().commit()
    return jsonify({'message': 'Location added successfully'}), 201


