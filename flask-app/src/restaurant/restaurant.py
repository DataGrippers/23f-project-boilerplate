from flask import Blueprint, request, jsonify, make_response
import json
from src import db

restaurants = Blueprint('restaurants', __name__)

# Get all restaurants from the DB
@restaurants.route('/restaurants', methods=['GET'])
def get_restaurants():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT restaurant_name, cuisine_type, atmosphere_type, avg_rating FROM restaurant')
    row_headers = [x[0] for x in cursor.description]  # this will extract row headers
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get restaurant detail for restaurant with particular restaurantID
@restaurants.route('/restaurants/<restaurantID>', methods=['GET'])
def get_restaurant(restaurantID):
    cursor = db.get_db().cursor()
    # Use parameterized queries to avoid SQL injection
    cursor.execute('SELECT * FROM restaurant WHERE restaurantID = %s', (restaurantID,))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    if theData:
        for row in theData:
            json_data.append(dict(zip(row_headers, row)))
    else:
        json_data = {"error": "Restaurant not found"}
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response