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

@appetizers.route('/appetizers/<id>', methods=['GET'])
def get_appetizers_detail (id):
    query = 'SELECT id, menuId, item_name, price, item_description FROM appetizers WHERE id = ' + str(id)
    current_app.logger.info(query)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.item_description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

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


# get the top 5 products from the database
@appetizers.route('/mostExpensive')
def get_most_appetizers_products():
    cursor = db.get_db().cursor()
    query = '''
        SELECT id, menuId, item_name, price, item_description FROM appetizers
        ORDER BY list_price DESC
        LIMIT 5
    '''
    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]
    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []
    # fetch all the data from the cursor
    theData = cursor.fetchall()
    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)