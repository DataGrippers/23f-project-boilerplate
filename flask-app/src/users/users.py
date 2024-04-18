from flask import Blueprint, request, jsonify, make_response
import json
from src import db

users = Blueprint('users', __name__)

# Get all users from the DB
@users.route('/users', methods=['GET'])
def get_users():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT userID, username, student_bool, gender, age, budget FROM user')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    for row in cursor.fetchall():
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data), 200

# Get user details by userID
@users.route('/users/<userID>', methods=['GET'])
def get_user(userID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM user WHERE userID = %s', (userID,))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    row = cursor.fetchone()
    if row:
        json_data = dict(zip(row_headers, row))
    else:
        json_data = {"error": "User not found"}
    return jsonify(json_data), 200

# Create a new user
@users.route('/users', methods=['POST'])
def create_user():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO user (username, password, student_bool, school_name, school_year, school_major, fName, lName, gender, age, budget, biography, locationID, photoID, dietaryID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
                   (data['username'], data['password'], data['student_bool'], data['school_name'], data['school_year'], data['school_major'], data['fName'], data['lName'], data['gender'], data['age'], data['budget'], data['biography'], data['locationID'], data['photoID'], data['dietaryID']))
    db.get_db().commit()
    return jsonify({"message": "User created successfully"}), 201

# Update an existing user
@users.route('/users/<userID>', methods=['PUT'])
def update_user(userID):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE user SET username=%s, password=%s, student_bool=%s, school_name=%s, school_year=%s, school_major=%s, fName=%s, lName=%s, gender=%s, age=%s, budget=%s, biography=%s, locationID=%s, photoID=%s, dietaryID=%s WHERE userID=%s',
                   (data['username'], data['password'], data['student_bool'], data['school_name'], data['school_year'], data['school_major'], data['fName'], data['lName'], data['gender'], data['age'], data['budget'], data['biography'], data['locationID'], data['photoID'], data['dietaryID'], userID))
    db.get_db().commit()
    if cursor.rowcount == 0:
        return jsonify({"error": "User not found"}), 404
    return jsonify({"message": "User updated successfully"}), 200

# Delete a user
@users.route('/users/<userID>', methods=['DELETE'])
def delete_user(userID):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM user WHERE userID = %s', (userID,))
    db.get_db().commit()
    if cursor.rowcount == 0:
        return jsonify({"error": "User not found"}), 404
    return jsonify({"message": "User deleted successfully"}), 200

# Get all reviews made by a specific user
@users.route('/users/<userID>/reviews', methods=['GET'])
def get_user_reviews(userID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM rating WHERE userID = %s', (userID,))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    for row in cursor.fetchall():
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data), 200

# Get all users from the DB
@users.route('/userdiet', methods=['GET'])
def get_users_diet():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT userID, username, dietaryID FROM user')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    for row in cursor.fetchall():
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data), 200

@users.route('/users/<int:user_id>/dietary-id', methods=['PUT'])
def update_user_dietary_id(user_id):
    data = request.get_json()
    new_dietary_id = data.get('dietaryID')

    if new_dietary_id is None:
        return jsonify({"error": "dietaryID is required in the request body"}), 400

    cursor = db.get_db().cursor()
    cursor.execute('UPDATE users SET dietaryID = %s WHERE userID = %s', (new_dietary_id, user_id))
    db.get_db().commit()

    if cursor.rowcount == 0:
        return jsonify({"error": "User not found"}), 404

    return jsonify({"message": "Dietary ID updated successfully"}), 200