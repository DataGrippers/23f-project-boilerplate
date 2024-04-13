from flask import Blueprint, request, jsonify, make_response
import json
from src import db

restaurants = Blueprint('restaurants', __name__)

# Get all restaurants from the DB
@restaurants.route('/restaurants', methods=['GET'])
def get_restaurants():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT restaurant_name, cuisine_type, atmosphere_type, avg_rating FROM restaurant')
    row_headers = [x[0] for x in cursor.description] 
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

# Create a new restaurant
@restaurants.route('/restaurants', methods=['POST'])
def create_restaurant():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', 
                   (data['locationId'], data['menuId'], data['restaurant_name'], data['cuisine_type'], data['atmosphere_type'], data['on_campus_bool'], data['allergy_friendly_bool'], data['present_wait_time'], data['delivery_bool'], data['take_out_bool'], data['distance_from_user'], data['hours_of_operation'], data['reservation_required_bool'], data['avg_rating'], data['peak_hours']))
    db.get_db().commit()
    return jsonify({"message": "Restaurant created successfully"}), 201

# Update an existing restaurant
@restaurants.route('/restaurants/<restaurantID>', methods=['PUT'])
def update_restaurant(restaurantID):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE restaurant SET locationId=%s, menuId=%s, restaurant_name=%s, cuisine_type=%s, atmosphere_type=%s, on_campus_bool=%s, allergy_friendly_bool=%s, present_wait_time=%s, delivery_bool=%s, take_out_bool=%s, distance_from_user=%s, hours_of_operation=%s, reservation_required_bool=%s, avg_rating=%s, peak_hours=%s WHERE restaurantID=%s',
                   (data['locationId'], data['menuId'], data['restaurant_name'], data['cuisine_type'], data['atmosphere_type'], data['on_campus_bool'], data['allergy_friendly_bool'], data['present_wait_time'], data['delivery_bool'], data['take_out_bool'], data['distance_from_user'], data['hours_of_operation'], data['reservation_required_bool'], data['avg_rating'], data['peak_hours'], restaurantID))
    db.get_db().commit()
    if cursor.rowcount == 0:
        return jsonify({"error": "Restaurant not found"}), 404
    return jsonify({"message": "Restaurant updated successfully"}), 200

# Delete a restaurant
@restaurants.route('/restaurants/<restaurantID>', methods=['DELETE'])
def delete_restaurant(restaurantID):
    cursor = db.get_db().cursor()
    # Execute the delete operation
    cursor.execute('DELETE FROM restaurant WHERE restaurantID = %s', (restaurantID,))
    db.get_db().commit()
    # Check if the restaurant was actually deleted
    if cursor.rowcount == 0:
        return jsonify({"error": "Restaurant not found"}), 404
    return jsonify({"message": "Restaurant deleted successfully"}), 200

# Get all reviews for a specific restaurant
@restaurants.route('/restaurants/<restaurantID>/reviews', methods=['GET'])
def get_restaurant_reviews(restaurantID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM rating WHERE restaurantID = %s', (restaurantID,))
    row_headers = [x[0] for x in cursor.description]  
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

