from flask import Blueprint, request, jsonify, make_response
from src import db

photos = Blueprint('photos', __name__)

# Get all photos
@photos.route('/photos', methods=['GET'])
def get_photos():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM photo')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get a specific photo by ID
@photos.route('/photos/<photoID>', methods=['GET'])
def get_photo(photoID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM photo WHERE photoID = %s', (photoID,))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    if theData:
        for row in theData:
            json_data.append(dict(zip(row_headers, row)))
    else:
        json_data = {"error": "Photo not found"}
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Add a new photo
@photos.route('/photos', methods=['POST'])
def add_photo():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO photo (name, caption) VALUES (%s, %s)',
                   (data['name'], data['caption']))
    db.get_db().commit()
    return jsonify({"message": "Photo added successfully"}), 201

# Update an existing photo
@photos.route('/photos/<photoID>', methods=['PUT'])
def update_photo(photoID):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE photo SET name=%s, caption=%s WHERE photoID=%s',
                   (data['name'], data['caption'], photoID))
    db.get_db().commit()
    if cursor.rowcount == 0:
        return jsonify({"error": "Photo not found"}), 404
    return jsonify({"message": "Photo updated successfully"}), 200

# Delete a photo
@photos.route('/photos/<photoID>', methods=['DELETE'])
def delete_photo(photoID):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM photo WHERE photoID = %s', (photoID,))
    db.get_db().commit()
    if cursor.rowcount == 0:
        return jsonify({"error": "Photo not found"}), 404
    return jsonify({"message": "Photo deleted successfully"}), 200

# Get photos that have the same name
@photos.route('/photos/search', methods=['GET'])
def search_photos():
    search_query = request.args.get('query', '') 
    cursor = db.get_db().cursor()
    like_pattern = f'%{search_query}%'
    cursor.execute('SELECT * FROM photo WHERE name LIKE %s', (like_pattern,))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
