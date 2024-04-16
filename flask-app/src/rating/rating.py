#john

from flask import Blueprint, request, jsonify, current_app
import json
from src import db

ratings = Blueprint('ratings', __name__)

# Get all ratings from the database
@ratings.route('/ratings', methods=['GET'])
def get_ratings():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT id, review, num, restaurantID, userID FROM rating')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get ratings for a specific restaurantID
@ratings.route('/ratings/<int:restaurantID>', methods=['GET'])
def get_ratings_by_restaurant(restaurantID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT id, review, num, restaurantID, userID FROM rating WHERE restaurantID = %s', (restaurantID,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Add a new rating
@ratings.route('/ratings', methods=['POST'])
def add_rating():
    data = request.json
    current_app.logger.info(data)
    if 'review' not in data or 'num' not in data or 'restaurantID' not in data or 'userID' not in data:
        return jsonify({'error': 'Missing required fields'}), 400
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO rating (review, num, restaurantID, userID) VALUES (%s, %s, %s, %s)',
                   (data['review'], data['num'], data['restaurantID'], data['userID']))
    db.get_db().commit()
    return jsonify({"message": "Rating added successfully"}), 201

# Get highest rated restaurants
@ratings.route('/highestRated', methods=['GET'])
def get_highest_rated_restaurants():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT restaurantID, AVG(num) AS avg_rating FROM rating GROUP BY restaurantID ORDER BY avg_rating DESC LIMIT 5')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Update a rating
@ratings.route('/ratings/<int:ratingID>', methods=['PUT'])
def update_rating(ratingID):
    data = request.json
    current_app.logger.info(data)
    if 'review' not in data or 'num' not in data:
        return jsonify({'error': 'Missing required fields'}), 400
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE rating SET review = %s, num = %s WHERE id = %s',
                   (data['review'], data['num'], ratingID))
    db.get_db().commit()
    return jsonify({"message": "Rating updated successfully"}), 200