from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


kidsmeals = Blueprint('kidsmeals', __name__)


# Get all the kidsmeals from the database
@kidsmeals.route('/kidsmeals', methods=['GET'])
def get_kidsmeals():
   cursor = db.get_db().cursor()
   cursor.execute('SELECT id, menuId, item_name, price, item_description FROM kidsmeals')
   column_headers = [x[0] for x in cursor.item_description]
   json_data = []
   theData = cursor.fetchall()
   for row in theData:
       json_data.append(dict(zip(column_headers, row)))
   return jsonify(json_data)


# Get kidsmeals item description
@kidsmeals.route('/kidsmeals/<id>', methods=['GET'])
def get_kidsmeals_detail (id):
   query = 'SELECT id, menuId, item_name, price, item_description FROM kidsmeals WHERE id = ' + str(id)
   current_app.logger.info(query)
   cursor = db.get_db().cursor()
   cursor.execute(query)
   column_headers = [x[0] for x in cursor.item_description]
   json_data = []
   the_data = cursor.fetchall()
   for row in the_data:
       json_data.append(dict(zip(column_headers, row)))
   return jsonify(json_data)


# get kidsmeals price
@kidsmeals.route('/kidsmeals/<id>', methods=['GET'])
def get_kidsmeals_price (id):
   query = 'SELECT id, menuId, item_name, price, item_description FROM kidsmeals WHERE id = ' + str(id)
   current_app.logger.info(query)
   cursor = db.get_db().cursor()
   cursor.execute(query)
   column_headers = [x[0] for x in cursor.price]
   json_data = []
   the_data = cursor.fetchall()
   for row in the_data:
       json_data.append(dict(zip(column_headers, row)))
   return jsonify(json_data)


# add kidsmeals
@kidsmeals.route('/kidsmeals', methods=['POST'])
def add_new_kidsmeals():
   the_data = request.json
   current_app.logger.info(the_data)
   name = the_data['item_name']
   price = the_data['price']
   description = the_data['item_description']
   query = 'insert into kidsmeals (product_name, description, category, list_price) values ("'
   query += name + '", "'
   query += description + '", "'
   query += str(price) + ')'
   current_app.logger.info(query)
   cursor = db.get_db().cursor()
   cursor.execute(query)
   db.get_db().commit()
   return 'Success!'

# get the top 5 most expensive kidsmeals from the database
@kidsmeals.route('/mostExpensive')
def get_most_kidsmeals_products():
   cursor = db.get_db().cursor()
   query = '''
       SELECT id, menuId, item_name, price, item_description FROM kidsmeals
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
@kidsmeals.route('/leastExpensive')
def get_most_kidsmeals_products():
   cursor = db.get_db().cursor()
   query = '''
       SELECT id, menuId, item_name, price, item_description FROM kidsmeals
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

# Update kidsmeal
@kidsmeals.route('/kidsmeals', methods=['PUT'])
def update_kidsmeal():
   data = request.json
  
   current_app.logger.info(data)
  
   if 'menuId' not in data or 'item_name' not in data or 'price' not in data or 'item_description' not in data:
       return jsonify({'error': 'Missing required fields'}), 400
   cursor = db.get_db().cursor()
   cursor.execute('UPDATE kidsmeals SET id = %s, menuId = %s, item_name = %s, price = %s, item_description = %s WHERE id = %s',
                  (data['id'], data['menuId'], data['item_name'], data['price'], data['item_description']))
   db.get_db().commit()


   cursor.execute('SELECT id, menuId, item_name, price, item_description FROM kidsmeals WHERE id = %s', data['id'])
   row_headers = [x[0] for x in cursor.description]
   updated_kidsmeals = dict(zip(row_headers, cursor.fetchone()))


   return jsonify(updated_kidsmeals), 200   