from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

appetizers = Blueprint('appetizers', __name__)

# Get all the appetizers from the database
@appetizers.route('/appetizers', methods=['GET'])
def get_appetizers():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT id, menuId, item_name, price, item_description FROM appetizers')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get appetizers item description
@appetizers.route('/appetizers/<id>', methods=['GET'])
def get_appetizers_detail (id):
    query = 'SELECT id, menuId, item_name, price, item_description FROM appetizers WHERE id = ' + str(id)
    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# get appetizers price
@appetizers.route('/appetizers/<id>', methods=['GET'])
def get_appetizers_price (id):
    query = 'SELECT id, menuId, item_name, price, item_description FROM appetizers WHERE id = ' + str(id)
    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.price]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# add appetizers
@appetizers.route('/appetizers', methods=['POST'])
def add_new_appetizers():
    the_data = request.json
    current_app.logger.info(the_data)
    name = the_data['item_name']
    price = the_data['price']
    description = the_data['item_description']
    query = 'insert into appetizers (product_name, description, category, list_price) values ("'
    query += name + '", "'
    query += description + '", "'
    query += str(price) + ')'
    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    return 'Success!'

# get the top 5 most expensive appetizers from the database
@appetizers.route('/mostExpensive')
def get_most_appetizers_products():
    cursor = db.get_db().cursor()
    query = '''
        SELECT id, menuId, item_name, price, item_description FROM appetizers
        ORDER BY list_price DESC
        LIMIT 5
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# get the top 5 least expensive from the database
@appetizers.route('/leastExpensive')
def get_least_appetizers_products():
    cursor = db.get_db().cursor()
    query = '''
        SELECT id, menuId, item_name, price, item_description FROM appetizers
        ORDER BY list_price ASC
        LIMIT 5
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)


# Update appetizer
@appetizers.route('/appetizers', methods=['PUT'])
def update_appetizer():
    data = request.json
    
    current_app.logger.info(data)
    
    if 'menuId' not in data or 'item_name' not in data or 'price' not in data or 'item_description' not in data:
        return jsonify({'error': 'Missing required fields'}), 400
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE appetizers SET id = %s, menuId = %s, item_name = %s, price = %s, item_description = %s WHERE id = %s',
                   (data['id'], data['menuId'], data['item_name'], data['price'], data['item_description']))
    db.get_db().commit()

    cursor.execute('SELECT id, menuId, item_name, price, item_description FROM appetizers WHERE id = %s', data['id'])
    row_headers = [x[0] for x in cursor.description]
    updated_appetizers = dict(zip(row_headers, cursor.fetchone()))

    return jsonify(updated_appetizers), 200     