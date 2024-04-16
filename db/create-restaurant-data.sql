-- creating database for restaurant
DROP DATABASE HungryHunt;
CREATE DATABASE IF NOT EXISTS HungryHunt;
USE HungryHunt;

CREATE TABLE IF NOT EXISTS location
(
 locationId      int         NOT NULL AUTO_INCREMENT,
 city_name       varchar(75) NOT NULL,
 num_restaurants int         NOT NULL,
 zipcode      int NOT NULL,
 PRIMARY KEY (locationId)
);

CREATE TABLE IF NOT EXISTS menu (
 menuID int NOT NULL AUTO_INCREMENT,
 PRIMARY KEY (menuID)
);

CREATE TABLE IF NOT EXISTS appetizers (
 id int NOT NULL,
menuId int NOT NULL,
 item_name varchar(100) NOT NULL,
 price decimal NOT NULL,
 item_description varchar(4096) NOT NULL,
 PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS drinks (
 id int NOT NULL,
menuId int NOT NULL,
 item_name varchar(100) NOT NULL,
 price decimal NOT NULL,
 item_description varchar(4096) NOT NULL,
 PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS maincourse (
 id int NOT NULL,
menuId int NOT NULL,
 item_name varchar(100) NOT NULL,
 price decimal NOT NULL,
 item_description varchar(4096) NOT NULL,
 PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict

);

CREATE TABLE IF NOT EXISTS desserts (
id int NOT NULL,
menuId int NOT NULL,
 item_name varchar(100) NOT NULL,
 price decimal NOT NULL,
 item_description varchar(4096) NOT NULL,
 PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS kidsmeal (
 id int NOT NULL,
menuId int NOT NULL,
 item_name varchar(100) NOT NULL,
 price decimal NOT NULL,
 item_description varchar(4096) NOT NULL,
 PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS restaurant
(
 locationId int NOT NULL,
 menuId int NOT NULL,
 restaurantID int NOT NULL AUTO_INCREMENT,
 restaurant_name varchar(100) NOT NULL,
 cuisine_type varchar(75) NOT NULL,
 atmosphere_type varchar(75) NOT NULL,
 on_campus_bool bool NOT NULL,
 allergy_friendly_bool bool NOT NULL,
 present_wait_time time NOT NULL,
 delivery_bool bool NOT NULL,
 take_out_bool bool NOT NULL,
 distance_from_user float NOT NULL,
 hours_of_operation int NOT NULL,
 reservation_required_bool bool NOT NULL,
 avg_rating float NOT NULL,
 peak_hours VARCHAR(20) NOT NULL,
 PRIMARY KEY(restaurantID),
 CONSTRAINT FOREIGN KEY (menuId) REFERENCES menu(menuID) ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE IF NOT EXISTS dietary_restrictions
(
 dietaryID int NOT NULL AUTO_INCREMENT,
 nuts_bool bool NOT NULL,
 vegetarian_bool bool NOT NULL,
 gluten_bool bool NOT NULL,
 eggs_bool bool NOT NULL,
 dairy_bool bool NOT NULL,
 PRIMARY KEY (dietaryID)
);

CREATE TABLE IF NOT EXISTS photo (
 photoID INT AUTO_INCREMENT,
 name VARCHAR(50) NOT NULL,
 caption TEXT,
 PRIMARY KEY(photoID)
);

CREATE TABLE IF NOT EXISTS user
(
 userID int NOT NULL,
 username varchar(75) UNIQUE NOT NULL,
 password varchar(75) NOT NULL,
 student_bool boolean NOT NULL,
 school_name varchar(75),
 school_year int,
 school_major varchar(75),
 fName varchar(75) NOT NULL,
 lName varchar(75) NOT NULL,
 gender varchar(75) NOT NULL,
 age int NOT NULL,
 budget int NOT NULL,
 biography TEXT,
 locationID int NOT NULL,
 photoID int NOT NULL,
 dietaryID int NOT NULL,
 PRIMARY KEY(userID),
 CONSTRAINT FOREIGN KEY (locationID) REFERENCES location(locationId) ON UPDATE cascade ON DELETE cascade,
  CONSTRAINT FOREIGN KEY (photoID) REFERENCES photo(photoID) ON UPDATE cascade ON DELETE cascade,
  CONSTRAINT FOREIGN KEY (dietaryID) REFERENCES dietary_restrictions(dietaryID) ON UPDATE cascade ON DELETE cascade
);

CREATE TABLE IF NOT EXISTS rating (
 id INT NOT NULL AUTO_INCREMENT,
 review TEXT,
 num INT NOT NULL,
 restaurantID INT NOT NULL,
 userID INT NOT NULL,
 PRIMARY KEY(id),
 CONSTRAINT fk_restaurant FOREIGN KEY (restaurantID) REFERENCES restaurant(restaurantID) ON UPDATE cascade ON DELETE cascade,
 CONSTRAINT fk_user FOREIGN KEY (userId) REFERENCES user(userID) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO location (city_name, num_restaurants, zipcode) VALUES
('New York City', 50, 10001),
('Los Angeles', 40, 90001),
('Chicago', 30, 60601),
('Houston', 25, 77001),
('Phoenix', 20, 85001),
('Philadelphia', 35, 19019),
('San Antonio', 15, 78201),
('San Diego', 20, 92101),
('Dallas', 30, 75201),
('San Jose', 25, 95101);

INSERT INTO menu (menuID) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- For menu ID 1
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(11, 1, 'Chocolate Lava Cake', 7.99, 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.'),
(12, 1, 'New York Cheesecake', 6.99, 'Creamy cheesecake with a graham cracker crust, topped with fruit compote.'),
(13, 1, 'Tiramisu', 8.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cream.'),
(14, 1, 'Fruit Tart', 5.99, 'Buttery tart shell filled with pastry cream and topped with assorted fresh fruits.'),
(15, 1, 'Key Lime Pie', 6.49, 'Tangy key lime filling in a graham cracker crust, topped with whipped cream.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(11, 1, 'Spinach Artichoke Dip', 9.99, 'Creamy dip served with tortilla chips.'),
(12, 1, 'Mozzarella Sticks', 8.49, 'Fried mozzarella cheese sticks served with marinara sauce.'),
(13, 1, 'Chicken Wings', 11.99, 'Crispy chicken wings tossed in your choice of sauce (Buffalo, BBQ, or Garlic Parmesan).'),
(14, 1, 'Bruschetta', 7.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(15, 1, 'Loaded Nachos', 10.99, 'Tortilla chips topped with cheese, black beans, jalapenos, sour cream, and guacamole.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(11, 1, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or Dr. Pepper.'),
(12, 1, 'Iced Tea', 2.99, 'Refreshing iced tea with lemon slices.'),
(13, 1, 'Lemonade', 3.49, 'Homemade lemonade served with ice.'),
(14, 1, 'Beer', 5.99, 'Selection of domestic and imported beers.'),
(15, 1, 'Wine', 7.99, 'Variety of red and white wines by the glass or bottle.');
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(11, 1, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(12, 1, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(13, 1, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(14, 1, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(15, 1, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(11, 1, 'Grilled Salmon', 18.99, 'Fresh salmon fillet grilled to perfection, served with seasonal vegetables and rice.'),
(12, 1, 'Steak Frites', 24.99, 'Grilled ribeye steak served with crispy French fries and garlic aioli.'),
(13, 1, 'Chicken Alfredo', 16.99, 'Grilled chicken breast served over fettuccine pasta with creamy Alfredo sauce.'),
(14, 1, 'Vegetable Stir Fry', 14.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(15, 1, 'Burger and Fries', 13.99, 'Juicy beef patty topped with cheese, lettuce, tomato, onion, and pickles, served with crispy fries.');


-- For menu ID 2
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(21, 2, 'Chocolate Lava Cake', 7.99, 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.'),
(22, 2, 'New York Cheesecake', 6.99, 'Creamy cheesecake with a graham cracker crust, topped with fruit compote.'),
(23, 2, 'Tiramisu', 8.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cream.'),
(24, 2, 'Fruit Tart', 5.99, 'Buttery tart shell filled with pastry cream and topped with assorted fresh fruits.'),
(25, 2, 'Key Lime Pie', 6.49, 'Tangy key lime filling in a graham cracker crust, topped with whipped cream.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(21, 2, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or Dr. Pepper.'),
(22, 2, 'Iced Tea', 2.99, 'Refreshing iced tea with lemon slices.'),
(23, 2, 'Lemonade', 3.49, 'Homemade lemonade served with ice.'),
(24, 2, 'Beer', 5.99, 'Selection of domestic and imported beers.'),
(25, 2, 'Wine', 7.99, 'Variety of red and white wines by the glass or bottle.');
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(21, 2, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(22, 2, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(23, 2, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(24, 2, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(25, 2, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(21, 2, 'Spinach Artichoke Dip', 9.99, 'Creamy dip served with tortilla chips.'),
(22, 2, 'Mozzarella Sticks', 8.49, 'Fried mozzarella cheese sticks served with marinara sauce.'),
(23, 2, 'Chicken Wings', 11.99, 'Crispy chicken wings tossed in your choice of sauce (Buffalo, BBQ, or Garlic Parmesan).'),
(24, 2, 'Bruschetta', 7.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(25, 2, 'Loaded Nachos', 10.99, 'Tortilla chips topped with cheese, black beans, jalapenos, sour cream, and guacamole.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(21, 2, 'Grilled Salmon', 18.99, 'Fresh salmon fillet grilled to perfection, served with seasonal vegetables and rice.'),
(22, 2, 'Steak Frites', 24.99, 'Grilled ribeye steak served with crispy French fries and garlic aioli.'),
(23, 2, 'Chicken Alfredo', 16.99, 'Grilled chicken breast served over fettuccine pasta with creamy Alfredo sauce.'),
(24, 2, 'Vegetable Stir Fry', 14.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(25, 2, 'Burger and Fries', 13.99, 'Juicy beef patty topped with cheese, lettuce, tomato, onion, and pickles, served with crispy fries.');


-- For menu ID 3
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(31, 3, 'Chocolate Lava Cake', 7.99, 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.'),
(32, 3, 'New York Cheesecake', 6.99, 'Creamy cheesecake with a graham cracker crust, topped with fruit compote.'),
(33, 3, 'Tiramisu', 8.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cream.'),
(34, 3, 'Fruit Tart', 5.99, 'Buttery tart shell filled with pastry cream and topped with assorted fresh fruits.'),
(35, 3, 'Key Lime Pie', 6.49, 'Tangy key lime filling in a graham cracker crust, topped with whipped cream.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(31, 3, 'Grilled Salmon', 18.99, 'Fresh salmon fillet grilled to perfection, served with seasonal vegetables and rice.'),
(32, 3, 'Steak Frites', 24.99, 'Grilled ribeye steak served with crispy French fries and garlic aioli.'),
(33, 3, 'Chicken Alfredo', 16.99, 'Grilled chicken breast served over fettuccine pasta with creamy Alfredo sauce.'),
(34, 3, 'Vegetable Stir Fry', 14.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(35, 3, 'Burger and Fries', 13.99, 'Juicy beef patty topped with cheese, lettuce, tomato, onion, and pickles, served with crispy fries.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(31, 3, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or Dr. Pepper.'),
(32, 3, 'Iced Tea', 2.99, 'Refreshing iced tea with lemon slices.'),
(33, 3, 'Lemonade', 3.49, 'Homemade lemonade served with ice.'),
(34, 3, 'Beer', 5.99, 'Selection of domestic and imported beers.'),
(35, 3, 'Wine', 7.99, 'Variety of red and white wines by the glass or bottle.');
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(31, 3, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(32, 3, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(33, 3, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(34, 3, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(35, 3, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(31, 3, 'Spinach Artichoke Dip', 9.99, 'Creamy dip served with tortilla chips.'),
(32, 3, 'Mozzarella Sticks', 8.49, 'Fried mozzarella cheese sticks served with marinara sauce.'),
(33, 3, 'Chicken Wings', 11.99, 'Crispy chicken wings tossed in your choice of sauce (Buffalo, BBQ, or Garlic Parmesan).'),
(34, 3, 'Bruschetta', 7.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(35, 3, 'Loaded Nachos', 10.99, 'Tortilla chips topped with cheese, black beans, jalapenos, sour cream, and guacamole.');
-- For menu ID 4
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(41, 4, 'Chocolate Lava Cake', 7.99, 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.'),
(42, 4, 'New York Cheesecake', 6.99, 'Creamy cheesecake with a graham cracker crust, topped with fruit compote.'),
(43, 4, 'Tiramisu', 8.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cream.'),
(44, 4, 'Fruit Tart', 5.99, 'Buttery tart shell filled with pastry cream and topped with assorted fresh fruits.'),
(45, 4, 'Key Lime Pie', 6.49, 'Tangy key lime filling in a graham cracker crust, topped with whipped cream.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(41, 4, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or Dr. Pepper.'),
(42, 4, 'Iced Tea', 2.99, 'Refreshing iced tea with lemon slices.'),
(43, 4, 'Lemonade', 3.49, 'Homemade lemonade served with ice.'),
(44, 4, 'Beer', 5.99, 'Selection of domestic and imported beers.'),
(45, 4, 'Wine', 7.99, 'Variety of red and white wines by the glass or bottle.');
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(41, 4, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(42, 4, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(43, 4, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(44, 4, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(45, 4, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(41, 4, 'Spinach Artichoke Dip', 9.99, 'Creamy dip served with tortilla chips.'),
(42, 4, 'Mozzarella Sticks', 8.49, 'Fried mozzarella cheese sticks served with marinara sauce.'),
(43, 4, 'Chicken Wings', 11.99, 'Crispy chicken wings tossed in your choice of sauce (Buffalo, BBQ, or Garlic Parmesan).'),
(44, 4, 'Bruschetta', 7.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(45, 4, 'Loaded Nachos', 10.99, 'Tortilla chips topped with cheese, black beans, jalapenos, sour cream, and guacamole.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(41, 4, 'Grilled Salmon', 18.99, 'Fresh salmon fillet grilled to perfection, served with seasonal vegetables and rice.'),
(42, 4, 'Steak Frites', 24.99, 'Grilled ribeye steak served with crispy French fries and garlic aioli.'),
(43, 4, 'Chicken Alfredo', 16.99, 'Grilled chicken breast served over fettuccine pasta with creamy Alfredo sauce.'),
(44, 4, 'Vegetable Stir Fry', 14.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(45, 4, 'Burger and Fries', 13.99, 'Juicy beef patty topped with cheese, lettuce, tomato, onion, and pickles, served with crispy fries.');


-- For menu ID 5
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(51, 5, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(52, 5, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(53, 5, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(54, 5, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(55, 5, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(51, 5, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or Dr. Pepper.'),
(52, 5, 'Iced Tea', 2.99, 'Refreshing iced tea with lemon slices.'),
(53, 5, 'Lemonade', 3.49, 'Homemade lemonade served with ice.'),
(54, 5, 'Beer', 5.99, 'Selection of domestic and imported beers.'),
(55, 5, 'Wine', 7.99, 'Variety of red and white wines by the glass or bottle.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(51, 5, 'Spinach Artichoke Dip', 9.99, 'Creamy dip served with tortilla chips.'),
(52, 5, 'Mozzarella Sticks', 8.49, 'Fried mozzarella cheese sticks served with marinara sauce.'),
(53, 5, 'Chicken Wings', 11.99, 'Crispy chicken wings tossed in your choice of sauce (Buffalo, BBQ, or Garlic Parmesan).'),
(54, 5, 'Bruschetta', 7.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(55, 5, 'Loaded Nachos', 10.99, 'Tortilla chips topped with cheese, black beans, jalapenos, sour cream, and guacamole.');
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(51, 5, 'Chocolate Lava Cake', 7.99, 'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.'),
(52, 5, 'New York Cheesecake', 6.99, 'Creamy cheesecake with a graham cracker crust, topped with fruit compote.'),
(53, 5, 'Tiramisu', 8.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cream.'),
(54, 5, 'Fruit Tart', 5.99, 'Buttery tart shell filled with pastry cream and topped with assorted fresh fruits.'),
(55, 5, 'Key Lime Pie', 6.49, 'Tangy key lime filling in a graham cracker crust, topped with whipped cream.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(51, 5, 'Grilled Salmon', 18.99, 'Fresh salmon fillet grilled to perfection, served with seasonal vegetables and rice.'),
(52, 5, 'Steak Frites', 24.99, 'Grilled ribeye steak served with crispy French fries and garlic aioli.'),
(53, 5, 'Chicken Alfredo', 16.99, 'Grilled chicken breast served over fettuccine pasta with creamy Alfredo sauce.'),
(54, 5, 'Vegetable Stir Fry', 14.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(55, 5, 'Burger and Fries', 13.99, 'Juicy beef patty topped with cheese, lettuce, tomato, onion, and pickles, served with crispy fries.');


INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES
(1, 1, 'Mexican Fiesta', 'Mexican', 'Vibrant', false, true, '00:30:00', true, true, 2.8, 10, false, 4.3, '5pm-10pm'),
(2, 2, 'Thai Spice', 'Thai', 'Relaxed', false, true, '00:25:00', true, true, 3.5, 11, false, 4.1, '6pm-9pm'),
(3, 3, 'Mediterranean Breeze', 'Mediterranean', 'Chic', true, true, '00:20:00', true, true, 1.9, 12, true, 4.4, '12pm-3pm, 7pm-10pm'),
(1, 4, 'French Delight', 'French', 'Elegant', false, true, '00:35:00', true, true, 3.2, 9, true, 4.5, '7pm-10pm'),
(2, 5, 'Indian Spice', 'Indian', 'Colorful', false, true, '00:40:00', true, true, 2.6, 10, false, 4.0, '6pm-9pm');

INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES
(false, true, true, true, false),
(true, false, true, false, true),
(false, true, false, false, true),
(true, true, true, true, true),
(false, false, true, true, true);

INSERT INTO photo (name, caption) VALUES
('tacos.jpg', 'Delicious tacos with salsa and guacamole'),
('padthai.jpg', 'Authentic Pad Thai noodles with shrimp and peanuts'),
('hummus.jpg', 'Creamy hummus with pita bread and vegetables'),
('cremebrulee.jpg', 'Classic French dessert with caramelized sugar on top'),
('biryani.jpg', 'Spicy and flavorful Indian biryani rice dish');

INSERT INTO user (userID, username, password, student_bool, school_name, school_year, school_major, fName, lName, gender, age, budget, biography, locationID, photoID, dietaryID) VALUES
(1,'emily_wong', 'p@ssw0rd', true, 'LMN College', 2, 'Biology', 'Emily', 'Wong', 'Female', 21, 45, 'Adventurous eater and nature lover', 1, 1, 1),
(2,'michael_jones', 'mjones123', false, NULL, NULL, NULL, 'Michael', 'Jones', 'Male', 30, 70, 'Food blogger and chef', 2, 2, 2),
(3,'sara_garcia', 'ilovefood', true, 'PQR University', 4, 'Business', 'Sara', 'Garcia', 'Female', 24, 55, 'Always looking for the best restaurants in town', 3, 3, 3),
(4,'david_smith', 'password123', true, 'ABC University', 3, 'Engineering', 'David', 'Smith', 'Male', 22, 60, 'Tech enthusiast and foodie', 1, 4, 4),
(5,'jessica_brown', 'brownie', false, NULL, NULL, NULL, 'Jessica', 'Brown', 'Female', 28, 50, 'Passionate about travel and trying new cuisines', 2, 5, 5);

INSERT INTO rating (id, review, num, restaurantID, userID) VALUES
(1, 'Amazing tacos and margaritas!', 5, 4, 1),
(2, 'The Pad Thai was too spicy for my liking.', 3, 2, 2),
(3, 'The hummus platter was delicious and fresh.', 4, 3, 3),
(4, 'Wonderful French cuisine with impeccable service.', 1, 2, 4),
(5, 'The biryani was flavorful and authentic.', 2, 2, 5);
