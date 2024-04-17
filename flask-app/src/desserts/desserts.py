from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

desserts = Blueprint('desserts', __name__)

# Get all the desserts from the database
@desserts.route('/desserts', methods=['GET'])
def get_desserts():
   cursor = db.get_db().cursor()
   cursor.execute('SELECT id, menuId, item_name, price, item_description FROM desserts')
   column_headers = [x[0] for x in cursor.description]
   json_data = []
   theData = cursor.fetchall()
   for row in theData:
       json_data.append(dict(zip(column_headers, row)))
   return jsonify(json_data)

# Get desserts item description
@desserts.route('/desserts/<id>', methods=['GET'])
def get_desserts_detail (id):
   query = 'SELECT id, menuId, item_name, price, item_description FROM desserts WHERE id = ' + str(id)
   current_app.logger.info(query)
   cursor = db.get_db().cursor()
   cursor.execute(query)
   column_headers = [x[0] for x in cursor.description]
   json_data = []
   the_data = cursor.fetchall()
   for row in the_data:
       json_data.append(dict(zip(column_headers, row)))
   return jsonify(json_data)


# get desserts price
@desserts.route('/desserts/<id>', methods=['GET'])
def get_desserts_price (id):
   query = 'SELECT id, menuId, item_name, price, item_description FROM desserts WHERE id = ' + str(id)
   current_app.logger.info(query)
   cursor = db.get_db().cursor()
   cursor.execute(query)
   column_headers = [x[0] for x in cursor.price]
   json_data = []
   the_data = cursor.fetchall()
   for row in the_data:
       json_data.append(dict(zip(column_headers, row)))
   return jsonify(json_data)


# add desserts
@desserts.route('/desserts', methods=['POST'])
def add_new_desserts():
   the_data = request.json
   current_app.logger.info(the_data)
   name = the_data['item_name']
   price = the_data['price']
   description = the_data['item_description']
   query = 'insert into desserts (product_name, description, category, list_price) values ("'
   query += name + '", "'
   query += description + '", "'
   query += str(price) + ')'
   current_app.logger.info(query)
   cursor = db.get_db().cursor()
   cursor.execute(query)
   db.get_db().commit()
   return 'Success!'


# get the top 5 most expensive desserts from the database
@desserts.route('/mostExpensive')
def get_most_desserts_products():
   cursor = db.get_db().cursor()
   query = '''
       SELECT id, menuId, item_name, price, item_description FROM desserts
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
@desserts.route('/leastExpensive')
def get_least_desserts_products():
   cursor = db.get_db().cursor()
   query = '''
       SELECT id, menuId, item_name, price, item_description FROM desserts
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


# Update dessert
@desserts.route('/desserts', methods=['PUT'])
def update_dessert():
   data = request.json
  
   current_app.logger.info(data)
  
   if 'menuId' not in data or 'item_name' not in data or 'price' not in data or 'item_description' not in data:
       return jsonify({'error': 'Missing required fields'}), 400
   cursor = db.get_db().cursor()
   cursor.execute('UPDATE desserts SET id = %s, menuId = %s, item_name = %s, price = %s, item_description = %s WHERE id = %s',
                  (data['id'], data['menuId'], data['item_name'], data['price'], data['item_description']))
   db.get_db().commit()


   cursor.execute('SELECT id, menuId, item_name, price, item_description FROM desserts WHERE id = %s', data['id'])
   row_headers = [x[0] for x in cursor.description]
   updated_desserts = dict(zip(row_headers, cursor.fetchone()))


   return jsonify(updated_desserts), 200    