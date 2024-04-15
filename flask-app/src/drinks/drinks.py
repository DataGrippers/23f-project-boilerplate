from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


drinks = Blueprint('drinks', __name__)


# Get all the drinks from the database
@drinks.route('/drinks', methods=['GET'])
def get_drinks():
   cursor = db.get_db().cursor()
   cursor.execute('SELECT id, menuId, item_name, price, item_description FROM drinks')
   column_headers = [x[0] for x in cursor.item_description]
   json_data = []
   theData = cursor.fetchall()
   for row in theData:
       json_data.append(dict(zip(column_headers, row)))
   return jsonify(json_data)


# Get drinks item description
@drinks.route('/drinks/<id>', methods=['GET'])
def get_drinks_detail (id):
   query = 'SELECT id, menuId, item_name, price, item_description FROM drinks WHERE id = ' + str(id)
   current_app.logger.info(query)
   cursor = db.get_db().cursor()
   cursor.execute(query)
   column_headers = [x[0] for x in cursor.item_description]
   json_data = []
   the_data = cursor.fetchall()
   for row in the_data:
       json_data.append(dict(zip(column_headers, row)))
   return jsonify(json_data)


# get drinks price
@drinks.route('/drinks/<id>', methods=['GET'])
def get_drinks_price (id):
   query = 'SELECT id, menuId, item_name, price, item_description FROM drinks WHERE id = ' + str(id)
   current_app.logger.info(query)
   cursor = db.get_db().cursor()
   cursor.execute(query)
   column_headers = [x[0] for x in cursor.price]
   json_data = []
   the_data = cursor.fetchall()
   for row in the_data:
       json_data.append(dict(zip(column_headers, row)))
   return jsonify(json_data)


# add drinks
@drinks.route('/drinks', methods=['POST'])
def add_new_drinks():
   the_data = request.json
   current_app.logger.info(the_data)
   name = the_data['item_name']
   price = the_data['price']
   description = the_data['item_description']
   query = 'insert into drinks (product_name, description, category, list_price) values ("'
   query += name + '", "'
   query += description + '", "'
   query += str(price) + ')'
   current_app.logger.info(query)
   cursor = db.get_db().cursor()
   cursor.execute(query)
   db.get_db().commit()
   return 'Success!'


# get the top 5 most expensive drinks from the database
@drinks.route('/mostExpensive')
def get_most_drinks_products():
   cursor = db.get_db().cursor()
   query = '''
       SELECT id, menuId, item_name, price, item_description FROM drinks
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
@drinks.route('/leastExpensive')
def get_most_drinks_products():
   cursor = db.get_db().cursor()
   query = '''
       SELECT id, menuId, item_name, price, item_description FROM drinks
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




# Update drink
@drinks.route('/drinks', methods=['PUT'])
def update_drink():
   data = request.json
  
   current_app.logger.info(data)
  
   if 'menuId' not in data or 'item_name' not in data or 'price' not in data or 'item_description' not in data:
       return jsonify({'error': 'Missing required fields'}), 400
   cursor = db.get_db().cursor()
   cursor.execute('UPDATE drinks SET id = %s, menuId = %s, item_name = %s, price = %s, item_description = %s WHERE id = %s',
                  (data['id'], data['menuId'], data['item_name'], data['price'], data['item_description']))
   db.get_db().commit()


   cursor.execute('SELECT id, menuId, item_name, price, item_description FROM drinks WHERE id = %s', data['id'])
   row_headers = [x[0] for x in cursor.description]
   updated_drinks = dict(zip(row_headers, cursor.fetchone()))


   return jsonify(updated_drinks), 200    
