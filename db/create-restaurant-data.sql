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
('Austin', 20, 78701),
('Jacksonville', 15, 32201),
('San Francisco', 40, 94101),
('Indianapolis', 25, 46201),
('Columbus', 20, 43201),
('Fort Worth', 20, 76101),
('Charlotte', 25, 28201),
('Seattle', 30, 98101),
('Denver', 25, 80201),
('Washington', 35, 20001),
('Boston', 30, 02101),
('El Paso', 15, 79901),
('Detroit', 20, 48201),
('Nashville', 20, 37201),
('Portland', 25, 97201),
('Memphis', 15, 38101),
('Oklahoma City', 20, 73101),
('Las Vegas', 30, 89101),
('Louisville', 15, 40201),
('Baltimore', 25, 21201),
('Milwaukee', 20, 53201),
('Albuquerque', 15, 87101),
('Tucson', 15, 85701),
('Fresno', 15, 93701),
('Sacramento', 20, 95814),
('Mesa', 15, 85201),
('Kansas City', 20, 64101),
('Atlanta', 30, 30301),
('Long Beach', 20, 90801),
('Omaha', 15, 68101),
('Raleigh', 20, 27601),
('Colorado Springs', 15, 80901),
('Miami', 35, 33101),
('Virginia Beach', 20, 23450),
('Oakland', 20, 94601),
('Minneapolis', 25, 55401),
('Tulsa', 15, 74101),
('Arlington', 20, 76001),
('New Orleans', 20, 70112),
('Wichita', 15, 67201),
('Cleveland', 20, 44101),
('Bakersfield', 15, 93301),
('Tampa', 25, 33601),
('Aurora', 15, 80010),
('Anaheim', 20, 92801),
('Honolulu', 20, 96801),
('Santa Ana', 15, 92701),
('Corpus Christi', 15, 78401);

INSERT INTO menu (menuID) VALUES
(1), (2), (3), (4), (5),
(6), (7), (8), (9), (10),
(11), (12), (13), (14), (15),
(16), (17), (18), (19), (20),
(21), (22), (23), (24), (25),
(26), (27), (28), (29), (30),
(31), (32), (33), (34), (35),
(36), (37), (38), (39), (40);

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
-- For menu ID 6
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(61, 6, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(62, 6, 'Mini Hot Dogs', 6.49, 'Mini hot dogs served in soft buns with ketchup and mustard.'),
(63, 6, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(64, 6, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(65, 6, 'Cheese Quesadilla', 4.99, 'Flour tortilla filled with melted cheese, grilled to perfection.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(61, 6, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(62, 6, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(63, 6, 'Water', 1.49, 'Bottled water for hydration.'),
(64, 6, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(65, 6, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(61, 6, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(62, 6, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(63, 6, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(64, 6, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(65, 6, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(61, 6, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(62, 6, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(63, 6, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(64, 6, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(65, 6, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(61, 6, 'Grilled Chicken Strips', 7.99, 'Grilled chicken strips served with steamed vegetables and rice.'),
(62, 6, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(63, 6, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(64, 6, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(65, 6, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.');

-- For menu ID 7
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(71, 7, 'Mini Pancakes', 5.99, 'Miniature pancakes served with maple syrup and whipped cream.'),
(72, 7, 'PB&J Roll-Ups', 4.99, 'Peanut butter and jelly rolled up in soft tortillas for easy eating.'),
(73, 7, 'Chicken and Cheese Quesadilla', 6.49, 'Flour tortilla filled with grilled chicken and melted cheese.'),
(74, 7, 'Mini Corn Dogs', 5.49, 'Bite-sized corn dogs served with ketchup and mustard.'),
(75, 7, 'Ham and Cheese Roll-Ups', 6.99, 'Sliced ham and cheese rolled up in soft tortillas for a savory snack.');
INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(71, 7, 'Milkshake', 3.99, 'Creamy milkshake available in chocolate, vanilla, or strawberry flavors.'),
(72, 7, 'Orange Juice', 2.49, 'Freshly squeezed orange juice for a burst of vitamin C.'),
(73, 7, 'Water', 1.49, 'Bottled water for hydration.'),
(74, 7, 'Apple Juice', 2.99, 'Sweet and refreshing apple juice for kids.'),
(75, 7, 'Fruit Punch', 2.99, 'Fruity punch made with a blend of juices and soda for a fizzy treat.');
INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(71, 7, 'Fruit Kabobs', 4.49, 'Assorted fruits skewered on sticks for easy snacking.'),
(72, 7, 'Yogurt Parfait', 3.99, 'Layers of yogurt, granola, and fresh berries for a healthy snack.'),
(73, 7, 'Veggie Sticks', 3.49, 'Assorted vegetable sticks served with ranch dressing for dipping.'),
(74, 7, 'Cheese Cubes', 4.99, 'Assorted cheese cubes served with crackers for a quick bite.'),
(75, 7, 'Tortilla Chips and Salsa', 3.99, 'Crispy tortilla chips served with fresh salsa for dipping.');
INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(71, 7, 'Frozen Yogurt', 3.49, 'Creamy frozen yogurt available in various flavors.'),
(72, 7, 'Cookie Dough Bites', 2.99, 'Small bites of cookie dough served chilled for a sweet treat.'),
(73, 7, 'Fruit Cup', 3.49, 'Assorted fresh fruits served in a cup.'),
(74, 7, 'Ice Cream Cone', 2.99, 'Classic vanilla ice cream served in a crunchy cone.'),
(75, 7, 'Chocolate Pudding Cup', 1.99, 'Creamy chocolate pudding served in a convenient cup.');
INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(71, 7, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(72, 7, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(73, 7, 'Pasta with Marinara Sauce', 4.99, 'Pasta tossed in marinara sauce, topped with Parmesan cheese.'),
(74, 7, 'Grilled Cheese Sandwich', 5.49, 'Grilled sandwich with melted cheese served with fries and ketchup.'),
(75, 7, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

-- For menu ID 8
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(81, 8, 'Mini Burgers', 6.99, 'Miniature beef burgers served with lettuce, tomato, and ketchup.'),
(82, 8, 'Cheese Quesadilla', 5.49, 'Flour tortilla filled with melted cheese, grilled to perfection.'),
(83, 8, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(84, 8, 'Spaghetti with Meatballs', 7.49, 'Spaghetti pasta topped with marinara sauce and meatballs.'),
(85, 8, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(81, 8, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(82, 8, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(83, 8, 'Water', 1.49, 'Bottled water for hydration.'),
(84, 8, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(85, 8, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(81, 8, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(82, 8, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(83, 8, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(84, 8, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(85, 8, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(81, 8, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(82, 8, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(83, 8, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(84, 8, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(85, 8, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(81, 8, 'Grilled Chicken Strips', 7.99, 'Grilled chicken strips served with steamed vegetables and rice.'),
(82, 8, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(83, 8, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(84, 8, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(85, 8, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.');

-- For menu ID 9
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(91, 9, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(92, 9, 'Mini Cheeseburgers', 7.99, 'Miniature cheeseburgers served with fries and ketchup.'),
(93, 9, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(94, 9, 'Cheese Quesadilla', 5.49, 'Flour tortilla filled with melted cheese, grilled to perfection.'),
(95, 9, 'Grilled Chicken Strips', 7.49, 'Grilled chicken strips served with honey mustard dipping sauce.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(91, 9, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(92, 9, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(93, 9, 'Water', 1.49, 'Bottled water for hydration.'),
(94, 9, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(95, 9, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(91, 9, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(92, 9, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(93, 9, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(94, 9, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(95, 9, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(91, 9, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(92, 9, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(93, 9, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(94, 9, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(95, 9, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(91, 9, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(92, 9, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(93, 9, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(94, 9, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(95, 9, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese served with fries and ketchup.');


-- For menu ID 10
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(101, 10, 'Mini Chicken Tacos', 6.99, 'Miniature chicken tacos served with salsa and guacamole.'),
(102, 10, 'Cheese Quesadilla', 5.49, 'Flour tortilla filled with melted cheese, grilled to perfection.'),
(103, 10, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(104, 10, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(105, 10, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(101, 10, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(102, 10, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(103, 10, 'Water', 1.49, 'Bottled water for hydration.'),
(104, 10, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(105, 10, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(101, 10, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(102, 10, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(103, 10, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(104, 10, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(105, 10, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(101, 10, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(102, 10, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(103, 10, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(104, 10, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(105, 10, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(101, 10, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(102, 10, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(103, 10, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(104, 10, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(105, 10, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


-- For menu ID 11
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(111, 11, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(112, 11, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(113, 11, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(114, 11, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(115, 11, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(111, 11, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(112, 11, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(113, 11, 'Water', 1.49, 'Bottled water for hydration.'),
(114, 11, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(115, 11, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(111, 11, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(112, 11, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(113, 11, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(114, 11, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(115, 11, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(111, 11, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(112, 11, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(113, 11, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(114, 11, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(115, 11, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(111, 11, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(112, 11, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(113, 11, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(114, 11, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(115, 11, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


-- For menu ID 12
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(121, 12, 'Mini Cheeseburger', 6.99, 'Mini cheeseburger served with fries and ketchup.'),
(122, 12, 'Chicken Quesadilla', 7.49, 'Grilled chicken and cheese folded in a tortilla, served with salsa.'),
(123, 12, 'Pasta with Tomato Sauce', 5.99, 'Pasta served with tangy tomato sauce and grated Parmesan cheese.'),
(124, 12, 'Hot Dog', 5.49, 'Classic hot dog served with mustard and ketchup.'),
(125, 12, 'Cheese Quesadilla', 6.49, 'Grilled cheese folded in a tortilla, served with salsa.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(121, 12, 'Apple Juice', 2.99, '100% pure apple juice.'),
(122, 12, 'Orange Juice', 2.99, 'Freshly squeezed orange juice.'),
(123, 12, 'Milkshake', 3.49, 'Creamy milkshake available in chocolate, vanilla, or strawberry.'),
(124, 12, 'Iced Tea', 1.99, 'Chilled tea served over ice.'),
(125, 12, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(121, 12, 'Mixed Fruit Platter', 5.99, 'Assorted fresh fruits beautifully arranged on a platter.'),
(122, 12, 'Mozzarella Sticks', 4.99, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(123, 12, 'Potato Wedges', 3.99, 'Seasoned potato wedges served with sour cream dip.'),
(124, 12, 'Onion Rings', 4.49, 'Crispy battered onion rings served with barbecue sauce.'),
(125, 12, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(121, 12, 'Chocolate Brownie', 4.99, 'Rich chocolate brownie served warm with a scoop of vanilla ice cream.'),
(122, 12, 'Fruit Tart', 3.99, 'Butter pastry filled with custard and topped with fresh fruits.'),
(123, 12, 'Cupcake Assortment', 5.49, 'Assorted cupcakes in various flavors, perfect for sharing.'),
(124, 12, 'Cookies and Cream Milkshake', 4.49, 'Creamy milkshake blended with cookies and cream ice cream.'),
(125, 12, 'Banana Split', 6.99, 'Classic banana split with three scoops of ice cream, whipped cream, and toppings.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(121, 12, 'Grilled Chicken Sandwich', 7.99, 'Grilled chicken breast served on a bun with lettuce, tomato, and mayo.'),
(122, 12, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(123, 12, 'Spaghetti and Meatballs', 8.49, 'Spaghetti served with marinara sauce and beef meatballs.'),
(124, 12, 'Turkey and Cheese Sandwich', 6.99, 'Turkey and cheese sandwich served with lettuce, tomato, and mayo.'),
(125, 12, 'BBQ Chicken Pizza', 10.99, 'Pizza topped with barbecue sauce, grilled chicken, red onions, and cilantro.');


-- For menu ID 13
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(131, 13, 'Mini Corn Dogs', 6.49, 'Mini corn dogs served with ketchup and mustard.'),
(132, 13, 'Cheese Quesadilla', 5.99, 'Grilled cheese folded in a tortilla, served with salsa.'),
(133, 13, 'Chicken Tenders', 7.49, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(134, 13, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(135, 13, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(131, 13, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(132, 13, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.'),
(133, 13, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(134, 13, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(135, 13, 'Water', 1.49, 'Bottled water for hydration.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(131, 13, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(132, 13, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(133, 13, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(134, 13, 'Veggie Spring Rolls', 5.49, 'Crispy spring rolls filled with assorted vegetables, served with sweet chili sauce.'),
(135, 13, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(131, 13, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(132, 13, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(133, 13, 'Chocolate Chip Cookies', 3.49, 'Homemade chocolate chip cookies served warm.'),
(134, 13, 'Banana Split', 5.99, 'Classic banana split with three scoops of ice cream, whipped cream, and toppings.'),
(135, 13, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(131, 13, 'Cheeseburger Sliders', 7.99, 'Mini cheeseburgers served with fries and ketchup.'),
(132, 13, 'Chicken Quesadilla', 8.49, 'Grilled chicken and cheese folded in a tortilla, served with salsa.'),
(133, 13, 'Pasta with Tomato Sauce', 6.49, 'Pasta served with tangy tomato sauce and grated Parmesan cheese.'),
(134, 13, 'Hot Dog', 5.99, 'Classic hot dog served with mustard and ketchup.'),
(135, 13, 'Grilled Cheese Sandwich', 6.49, 'Classic grilled sandwich with melted cheese.');


-- For menu ID 14
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(141, 14, 'Mini Cheese Quesadilla', 5.99, 'Mini cheese quesadilla served with salsa for dipping.'),
(142, 14, 'Chicken Nuggets', 6.49, 'Bite-sized chicken nuggets served with dipping sauce.'),
(143, 14, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(144, 14, 'PB&J Uncrustables', 4.99, 'Peanut butter and jelly sandwich without crusts, perfect for little hands.'),
(145, 14, 'Mini Cheeseburgers', 7.49, 'Mini cheeseburgers served with fries and ketchup.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(141, 14, 'Apple Juice', 2.99, '100% pure apple juice.'),
(142, 14, 'Orange Juice', 2.99, 'Freshly squeezed orange juice.'),
(143, 14, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(144, 14, 'Water', 1.49, 'Bottled water for hydration.'),
(145, 14, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(141, 14, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(142, 14, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(143, 14, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(144, 14, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.'),
(145, 14, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(141, 14, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(142, 14, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(143, 14, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(144, 14, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(145, 14, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(141, 14, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(142, 14, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(143, 14, 'Spaghetti and Meatballs', 8.49, 'Spaghetti served with marinara sauce and beef meatballs.'),
(144, 14, 'Turkey and Cheese Sandwich', 6.99, 'Turkey and cheese sandwich served with lettuce, tomato, and mayo.'),
(145, 14, 'BBQ Chicken Pizza', 10.99, 'Pizza topped with barbecue sauce, grilled chicken, red onions, and cilantro.');

-- For menu ID 15
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(151, 15, 'Mini Cheese Quesadilla', 5.99, 'Mini cheese quesadilla served with salsa for dipping.'),
(152, 15, 'Chicken Tenders', 6.49, 'Breadcrumbed chicken tenders served with dipping sauce.'),
(153, 15, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(154, 15, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.'),
(155, 15, 'Mini Cheeseburgers', 7.49, 'Mini cheeseburgers served with fries and ketchup.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(151, 15, 'Apple Juice', 2.99, '100% pure apple juice.'),
(152, 15, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(153, 15, 'Water', 1.49, 'Bottled water for hydration.'),
(154, 15, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(155, 15, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(151, 15, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(152, 15, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(153, 15, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(154, 15, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.'),
(155, 15, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(151, 15, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(152, 15, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(153, 15, 'Chocolate Chip Cookies', 3.49, 'Homemade chocolate chip cookies served warm.'),
(154, 15, 'Banana Split', 5.99, 'Classic banana split with three scoops of ice cream, whipped cream, and toppings.'),
(155, 15, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(151, 15, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(152, 15, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(153, 15, 'Spaghetti and Meatballs', 8.49, 'Spaghetti served with marinara sauce and beef meatballs.'),
(154, 15, 'Turkey and Cheese Sandwich', 6.99, 'Turkey and cheese sandwich served with lettuce, tomato, and mayo.'),
(155, 15, 'BBQ Chicken Pizza', 10.99, 'Pizza topped with barbecue sauce, grilled chicken, red onions, and cilantro.');

-- For menu ID 16
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(161, 16, 'Mini Corn Dogs', 6.49, 'Mini corn dogs served with ketchup and mustard.'),
(162, 16, 'Cheese Quesadilla', 5.99, 'Grilled cheese folded in a tortilla, served with salsa.'),
(163, 16, 'Chicken Tenders', 7.49, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(164, 16, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(165, 16, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(161, 16, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(162, 16, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.'),
(163, 16, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(164, 16, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(165, 16, 'Water', 1.49, 'Bottled water for hydration.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(161, 16, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(162, 16, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(163, 16, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(164, 16, 'Veggie Spring Rolls', 5.49, 'Crispy spring rolls filled with assorted vegetables, served with sweet chili sauce.'),
(165, 16, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(161, 16, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(162, 16, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(163, 16, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(164, 16, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(165, 16, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(161, 16, 'Grilled Chicken Sandwich', 7.99, 'Grilled chicken breast served on a bun with lettuce, tomato, and mayo.'),
(162, 16, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(163, 16, 'Spaghetti and Meatballs', 8.49, 'Spaghetti served with marinara sauce and beef meatballs.'),
(164, 16, 'Hot Dog', 5.99, 'Classic hot dog served with mustard and ketchup.'),
(165, 16, 'Grilled Cheese Sandwich', 6.49, 'Classic grilled sandwich with melted cheese.');


-- For menu ID 17
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(171, 17, 'Mini Cheese Quesadilla', 5.99, 'Mini cheese quesadilla served with salsa for dipping.'),
(172, 17, 'Chicken Tenders', 6.49, 'Breadcrumbed chicken tenders served with dipping sauce.'),
(173, 17, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(174, 17, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.'),
(175, 17, 'Mini Cheeseburgers', 7.49, 'Mini cheeseburgers served with fries and ketchup.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(171, 17, 'Apple Juice', 2.99, '100% pure apple juice.'),
(172, 17, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(173, 17, 'Water', 1.49, 'Bottled water for hydration.'),
(174, 17, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(175, 17, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(171, 17, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(172, 17, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(173, 17, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(174, 17, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.'),
(175, 17, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(171, 17, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(172, 17, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(173, 17, 'Chocolate Chip Cookies', 3.49, 'Homemade chocolate chip cookies served warm.'),
(174, 17, 'Banana Split', 5.99, 'Classic banana split with three scoops of ice cream, whipped cream, and toppings.'),
(175, 17, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(171, 17, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(172, 17, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(173, 17, 'Spaghetti and Meatballs', 8.49, 'Spaghetti served with marinara sauce and beef meatballs.'),
(174, 17, 'Turkey and Cheese Sandwich', 6.99, 'Turkey and cheese sandwich served with lettuce, tomato, and mayo.'),
(175, 17, 'BBQ Chicken Pizza', 10.99, 'Pizza topped with barbecue sauce, grilled chicken, red onions, and cilantro.');

-- For menu ID 18
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(181, 18, 'Mini Corn Dogs', 6.49, 'Mini corn dogs served with ketchup and mustard.'),
(182, 18, 'Cheese Quesadilla', 5.99, 'Grilled cheese folded in a tortilla, served with salsa.'),
(183, 18, 'Chicken Tenders', 7.49, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(184, 18, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(185, 18, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(181, 18, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(182, 18, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.'),
(183, 18, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(184, 18, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(185, 18, 'Water', 1.49, 'Bottled water for hydration.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(181, 18, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(182, 18, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(183, 18, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(184, 18, 'Veggie Spring Rolls', 5.49, 'Crispy spring rolls filled with assorted vegetables, served with sweet chili sauce.'),
(185, 18, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(181, 18, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(182, 18, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(183, 18, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(184, 18, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(185, 18, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(181, 18, 'Grilled Chicken Sandwich', 7.99, 'Grilled chicken breast served on a bun with lettuce, tomato, and mayo.'),
(182, 18, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(183, 18, 'Spaghetti and Meatballs', 8.49, 'Spaghetti served with marinara sauce and beef meatballs.'),
(184, 18, 'Hot Dog', 5.99, 'Classic hot dog served with mustard and ketchup.'),
(185, 18, 'Grilled Cheese Sandwich', 6.49, 'Classic grilled sandwich with melted cheese.');

-- For menu ID 19
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(191, 19, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(192, 19, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(193, 19, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(194, 19, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(195, 19, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(191, 19, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(192, 19, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(193, 19, 'Water', 1.49, 'Bottled water for hydration.'),
(194, 19, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(195, 19, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(191, 19, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(192, 19, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(193, 19, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(194, 19, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(195, 19, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(191, 19, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(192, 19, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(193, 19, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(194, 19, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(195, 19, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(191, 19, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(192, 19, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(193, 19, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(194, 19, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(195, 19, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


-- For menu ID 20
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(201, 20, 'Mini Hot Dogs', 6.49, 'Mini hot dogs served with ketchup and mustard.'),
(202, 20, 'Cheese Quesadilla', 5.99, 'Grilled cheese folded in a tortilla, served with salsa.'),
(203, 20, 'Chicken Nuggets', 7.49, 'Breadcrumbed chicken nuggets served with fries and a small side salad.'),
(204, 20, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(205, 20, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(201, 20, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(202, 20, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.'),
(203, 20, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(204, 20, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(205, 20, 'Water', 1.49, 'Bottled water for hydration.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(201, 20, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(202, 20, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(203, 20, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(204, 20, 'Veggie Spring Rolls', 5.49, 'Crispy spring rolls filled with assorted vegetables, served with sweet chili sauce.'),
(205, 20, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(201, 20, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(202, 20, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(203, 20, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(204, 20, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(205, 20, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(201, 20, 'Grilled Chicken Sandwich', 7.99, 'Grilled chicken breast served on a bun with lettuce, tomato, and mayo.'),
(202, 20, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(203, 20, 'Spaghetti and Meatballs', 8.49, 'Spaghetti served with marinara sauce and beef meatballs.'),
(204, 20, 'Hot Dog', 5.99, 'Classic hot dog served with mustard and ketchup.'),
(205, 20, 'Grilled Cheese Sandwich', 6.49, 'Classic grilled sandwich with melted cheese.');


-- For menu ID 21
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(211, 21, 'Mini Cheese Quesadilla', 5.99, 'Mini cheese quesadilla served with salsa for dipping.'),
(212, 21, 'Chicken Tenders', 6.49, 'Breadcrumbed chicken tenders served with dipping sauce.'),
(213, 21, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(214, 21, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.'),
(215, 21, 'Mini Cheeseburgers', 7.49, 'Mini cheeseburgers served with fries and ketchup.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(211, 21, 'Apple Juice', 2.99, '100% pure apple juice.'),
(212, 21, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(213, 21, 'Water', 1.49, 'Bottled water for hydration.'),
(214, 21, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(215, 21, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(211, 21, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(212, 21, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(213, 21, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(214, 21, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.'),
(215, 21, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(211, 21, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(212, 21, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(213, 21, 'Chocolate Chip Cookies', 3.49, 'Homemade chocolate chip cookies served warm.'),
(214, 21, 'Banana Split', 5.99, 'Classic banana split with three scoops of ice cream, whipped cream, and toppings.'),
(215, 21, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(211, 21, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(212, 21, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(213, 21, 'Spaghetti and Meatballs', 8.49, 'Spaghetti served with marinara sauce and beef meatballs.'),
(214, 21, 'Turkey and Cheese Sandwich', 6.99, 'Turkey and cheese sandwich served with lettuce, tomato, and mayo.'),
(215, 21, 'BBQ Chicken Pizza', 10.99, 'Pizza topped with barbecue sauce, grilled chicken, red onions, and cilantro.');

-- For menu ID 22
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(221, 22, 'Mini Corn Dogs', 6.49, 'Mini corn dogs served with ketchup and mustard.'),
(222, 22, 'Cheese Quesadilla', 5.99, 'Grilled cheese folded in a tortilla, served with salsa.'),
(223, 22, 'Chicken Tenders', 7.49, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(224, 22, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(225, 22, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(221, 22, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(222, 22, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.'),
(223, 22, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(224, 22, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(225, 22, 'Water', 1.49, 'Bottled water for hydration.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(221, 22, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(222, 22, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(223, 22, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(224, 22, 'Veggie Spring Rolls', 5.49, 'Crispy spring rolls filled with assorted vegetables, served with sweet chili sauce.'),
(225, 22, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(221, 22, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(222, 22, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(223, 22, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.');


-- For menu ID 23
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(231, 23, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(232, 23, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(233, 23, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(234, 23, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(235, 23, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(231, 23, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(232, 23, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(233, 23, 'Water', 1.49, 'Bottled water for hydration.'),
(234, 23, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(235, 23, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(231, 23, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(232, 23, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(233, 23, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(234, 23, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(235, 23, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(231, 23, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(232, 23, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(233, 23, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(234, 23, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(235, 23, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(231, 23, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(232, 23, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(233, 23, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(234, 23, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(235, 23, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


-- For menu ID 24
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(241, 24, 'Mini Hot Dogs', 6.49, 'Mini hot dogs served with ketchup and mustard.'),
(242, 24, 'Cheese Quesadilla', 5.99, 'Grilled cheese folded in a tortilla, served with salsa.'),
(243, 24, 'Chicken Tenders', 7.49, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(244, 24, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(245, 24, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(241, 24, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(242, 24, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.'),
(243, 24, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(244, 24, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(245, 24, 'Water', 1.49, 'Bottled water for hydration.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(241, 24, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(242, 24, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(243, 24, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(244, 24, 'Veggie Spring Rolls', 5.49, 'Crispy spring rolls filled with assorted vegetables, served with sweet chili sauce.'),
(245, 24, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(241, 24, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(242, 24, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(243, 24, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(244, 24, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(245, 24, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(241, 24, 'Grilled Chicken Sandwich', 7.99, 'Grilled chicken breast served on a bun with lettuce, tomato, and mayo.'),
(242, 24, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(243, 24, 'Spaghetti and Meatballs', 8.49, 'Spaghetti served with marinara sauce and beef meatballs.'),
(244, 24, 'Hot Dog', 5.99, 'Classic hot dog served with mustard and ketchup.'),
(245, 24, 'Grilled Cheese Sandwich', 6.49, 'Classic grilled sandwich with melted cheese.');

-- For menu ID 25
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(251, 25, 'Mini Cheese Quesadilla', 5.99, 'Mini cheese quesadilla served with salsa for dipping.'),
(252, 25, 'Chicken Tenders', 6.49, 'Breadcrumbed chicken tenders served with dipping sauce.'),
(253, 25, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(254, 25, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.'),
(255, 25, 'Mini Cheeseburgers', 7.49, 'Mini cheeseburgers served with fries and ketchup.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(251, 25, 'Apple Juice', 2.99, '100% pure apple juice.'),
(252, 25, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.'),
(253, 25, 'Water', 1.49, 'Bottled water for hydration.'),
(254, 25, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(255, 25, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(251, 25, 'Carrot and Celery Sticks', 3.99, 'Fresh carrot and celery sticks served with ranch dressing and peanut butter.'),
(252, 25, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(253, 25, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(254, 25, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.'),
(255, 25, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(251, 25, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(252, 25, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(253, 25, 'Chocolate Chip Cookies', 3.49, 'Homemade chocolate chip cookies served warm.'),
(254, 25, 'Banana Split', 5.99, 'Classic banana split with three scoops of ice cream, whipped cream, and toppings.'),
(255, 25, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(251, 25, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(252, 25, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(253, 25, 'Spaghetti and Meatballs', 8.49, 'Spaghetti served with marinara sauce and beef meatballs.'),
(254, 25, 'Turkey and Cheese Sandwich', 6.99, 'Turkey and cheese sandwich served with lettuce, tomato, and mayo.'),
(255, 25, 'BBQ Chicken Pizza', 10.99, 'Pizza topped with barbecue sauce, grilled chicken, red onions, and cilantro.');


-- For menu ID 26
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(261, 26, 'Vegetable Spring Rolls', 5.99, 'Crispy vegetable spring rolls served with sweet chili sauce for dipping.'),
(262, 26, 'Teriyaki Chicken Skewers', 6.49, 'Grilled chicken skewers marinated in teriyaki sauce, served with steamed rice.'),
(263, 26, 'Yakisoba Noodles', 5.99, 'Stir-fried noodles with vegetables in a savory soy sauce.'),
(264, 26, 'Edamame', 4.49, 'Steamed soybeans sprinkled with sea salt.'),
(265, 26, 'Sweet and Sour Tofu', 6.99, 'Crispy tofu cubes tossed in a sweet and sour sauce, served with steamed rice.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(261, 26, 'Green Tea', 2.99, 'Refreshing green tea served hot or cold.'),
(262, 26, 'Lychee Lemonade', 3.49, 'Sweet and tangy lemonade with a hint of lychee flavor.'),
(263, 26, 'Coconut Water', 2.49, 'Naturally hydrating coconut water.'),
(264, 26, 'Mango Lassi', 3.99, 'Creamy yogurt-based drink blended with ripe mangoes.'),
(265, 26, 'Soy Milk', 1.99, 'Soy milk served chilled.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(261, 26, 'Gyoza (Potstickers)', 4.99, 'Pan-fried dumplings filled with vegetables and served with dipping sauce.'),
(262, 26, 'Miso Soup', 3.49, 'Traditional Japanese soup made with soybean paste, tofu, and seaweed.'),
(263, 26, 'Seaweed Salad', 4.99, 'Refreshing salad made with assorted seaweed and dressed with sesame oil.'),
(264, 26, 'Shrimp Tempura', 6.49, 'Crispy fried shrimp served with tempura dipping sauce.'),
(265, 26, 'Tofu Salad', 5.49, 'Salad made with mixed greens, crispy tofu cubes, and sesame dressing.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(261, 26, 'Mochi Ice Cream', 4.99, 'Chewy mochi rice cakes filled with ice cream in assorted flavors.'),
(262, 26, 'Red Bean Paste Bun', 2.49, 'Steamed bun filled with sweet red bean paste.'),
(263, 26, 'Matcha Green Tea Cake', 3.99, 'Sponge cake infused with matcha green tea flavor, topped with whipped cream.'),
(264, 26, 'Sesame Balls', 4.49, 'Crispy fried balls filled with sweetened black sesame paste.'),
(265, 26, 'Coconut Tapioca Pudding', 3.99, 'Creamy coconut milk pudding with tapioca pearls.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(261, 26, 'Chicken Teriyaki', 9.99, 'Grilled chicken glazed with teriyaki sauce, served with steamed rice and stir-fried vegetables.'),
(262, 26, 'Beef Bulgogi', 10.99, 'Korean-style marinated beef grilled to perfection, served with steamed rice and kimchi.'),
(263, 26, 'Vegetable Pad Thai', 8.49, 'Stir-fried rice noodles with tofu, bean sprouts, and peanuts in a tangy tamarind sauce.'),
(264, 26, 'Sushi Roll Combo', 12.99, 'Assorted sushi rolls including California roll, spicy tuna roll, and cucumber roll, served with soy sauce and wasabi.'),
(265, 26, 'Vegetable Fried Rice', 7.99, 'Fried rice cooked with mixed vegetables and seasoned with soy sauce and sesame oil.');

-- For menu ID 27
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(271, 27, 'Mini Margherita Pizza', 5.99, 'Mini pizza topped with tomato sauce, fresh mozzarella, and basil.'),
(272, 27, 'Spaghetti with Marinara Sauce', 6.49, 'Spaghetti pasta served with classic marinara sauce and grated Parmesan cheese.'),
(273, 27, 'Cheese Ravioli', 5.99, 'Ravioli filled with creamy ricotta cheese, served with marinara sauce.'),
(274, 27, 'Chicken Alfredo Pasta', 7.49, 'Fettuccine pasta tossed in creamy Alfredo sauce with grilled chicken strips.'),
(275, 27, 'Meatball Sub', 6.99, 'Italian meatballs topped with marinara sauce and melted mozzarella cheese, served in a toasted sub roll.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(271, 27, 'Italian Soda', 2.99, 'Refreshing soda flavored with fruity syrups and topped with whipped cream.'),
(272, 27, 'Limoncello', 4.49, 'Traditional Italian lemon liqueur served chilled.'),
(273, 27, 'Sparkling Water', 1.99, 'Bubbly mineral water imported from Italy.'),
(274, 27, 'Iced Tea', 2.49, 'Classic iced tea served with lemon wedges.'),
(275, 27, 'Espresso', 2.99, 'Strong and aromatic Italian coffee served in a small cup.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(271, 27, 'Bruschetta', 4.99, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil.'),
(272, 27, 'Caprese Salad', 5.49, 'Fresh mozzarella cheese, tomatoes, and basil leaves drizzled with balsamic glaze.'),
(273, 27, 'Antipasto Platter', 6.99, 'Assortment of Italian cured meats, cheeses, olives, and roasted vegetables.'),
(274, 27, 'Garlic Bread', 3.49, 'Toasted bread rubbed with garlic and butter, perfect for dipping in marinara sauce.'),
(275, 27, 'Stuffed Mushrooms', 5.99, 'Mushroom caps filled with a savory mixture of breadcrumbs, garlic, and herbs.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(271, 27, 'Tiramisu', 4.99, 'Classic Italian dessert made with layers of espresso-soaked ladyfingers and mascarpone cheese, dusted with cocoa powder.'),
(272, 27, 'Cannoli', 3.49, 'Crispy pastry shells filled with sweetened ricotta cheese and chocolate chips, dusted with powdered sugar.'),
(273, 27, 'Gelato', 3.99, 'Creamy Italian ice cream available in various flavors like chocolate, vanilla, and strawberry.'),
(274, 27, 'Panna Cotta', 4.49, 'Smooth and creamy Italian dessert made with sweetened cream and gelatin, served with fruit coulis.'),
(275, 27, 'Affogato', 4.99, 'Scoop of vanilla gelato "drowned" in a shot of hot espresso, topped with whipped cream.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(271, 27, 'Margherita Pizza', 10.99, 'Classic pizza topped with tomato sauce, fresh mozzarella, and basil leaves.'),
(272, 27, 'Fettuccine Alfredo', 12.99, 'Fettuccine pasta tossed in creamy Alfredo sauce and garnished with parsley.'),
(273, 27, 'Lasagna', 11.99, 'Layers of lasagna noodles, beef Bolognese sauce, ricotta cheese, and mozzarella cheese baked to perfection.'),
(274, 27, 'Chicken Parmesan', 13.99, 'Breaded chicken breast topped with marinara sauce and melted mozzarella cheese, served with spaghetti.'),
(275, 27, 'Risotto Primavera', 12.49, 'Creamy risotto rice cooked with seasonal vegetables, Parmesan cheese, and a hint of lemon zest.');


-- For menu ID 28
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(281, 28, 'Mini Cheeseburger', 5.99, 'Mini cheeseburger served with fries and ketchup.'),
(282, 28, 'Chicken Quesadilla', 6.49, 'Grilled chicken and cheese folded in a tortilla, served with salsa.'),
(283, 28, 'Pasta with Butter', 5.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(284, 28, 'Cheese Pizza', 6.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(285, 28, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(281, 28, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(282, 28, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(283, 28, 'Water', 1.49, 'Bottled water for hydration.'),
(284, 28, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(285, 28, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(281, 28, 'French Fries', 3.49, 'Crispy golden fries served with ketchup.'),
(282, 28, 'Chicken Wings', 5.99, 'Crispy chicken wings tossed in buffalo sauce, served with ranch dressing.'),
(283, 28, 'Caesar Salad', 4.99, 'Fresh romaine lettuce tossed with Caesar dressing, croutons, and Parmesan cheese.'),
(284, 28, 'Vegetable Spring Rolls', 4.49, 'Crispy vegetable spring rolls served with sweet chili sauce for dipping.'),
(285, 28, 'Cheese Sticks', 4.99, 'Breaded mozzarella cheese sticks served with marinara sauce.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(281, 28, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(282, 28, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(283, 28, 'Chocolate Chip Cookies', 3.49, 'Homemade chocolate chip cookies served warm.'),
(284, 28, 'Brownie Sundae', 5.99, 'Warm chocolate brownie topped with vanilla ice cream and chocolate syrup.'),
(285, 28, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(281, 28, 'Chicken Tenders', 7.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(282, 28, 'Beef Burger', 8.99, 'Classic beef burger served with lettuce, tomato, onion, and pickles.'),
(283, 28, 'Pork Tacos', 9.49, 'Soft corn tortillas filled with seasoned pork, onions, cilantro, and salsa.'),
(284, 28, 'Vegetable Stir-Fry', 10.99, 'Assorted vegetables stir-fried in a savory sauce, served over steamed rice.'),
(285, 28, 'BBQ Ribs', 11.99, 'Tender BBQ ribs served with coleslaw and cornbread.');

-- For menu ID 29
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(291, 29, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(292, 29, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(293, 29, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(294, 29, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(295, 29, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(291, 29, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(292, 29, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(293, 29, 'Water', 1.49, 'Bottled water for hydration.'),
(294, 29, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(295, 29, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(291, 29, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(292, 29, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(293, 29, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(294, 29, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(295, 29, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(291, 29, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(292, 29, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(293, 29, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(294, 29, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(295, 29, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(291, 29, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(292, 29, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(293, 29, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(294, 29, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(295, 29, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


-- For menu ID 30
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(301, 30, 'Mini Hot Dogs', 6.49, 'Mini hot dogs served with ketchup and mustard.'),
(302, 30, 'Cheese Quesadilla', 5.99, 'Grilled cheese folded in a tortilla, served with salsa.'),
(303, 30, 'Chicken Tenders', 7.49, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(304, 30, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(305, 30, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(301, 30, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(302, 30, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.'),
(303, 30, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(304, 30, 'Water', 1.49, 'Bottled water for hydration.'),
(305, 30, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(301, 30, 'French Fries', 3.99, 'Crispy golden fries served with ketchup.'),
(302, 30, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(303, 30, 'Veggie Sticks', 3.49, 'Assorted fresh vegetable sticks served with ranch dressing.'),
(304, 30, 'Garlic Bread', 3.99, 'Toasted bread rubbed with garlic and butter, perfect for dipping in marinara sauce.'),
(305, 30, 'Onion Rings', 4.99, 'Crispy battered onion rings served with ranch dressing.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(301, 30, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(302, 30, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(303, 30, 'Chocolate Chip Cookies', 3.49, 'Homemade chocolate chip cookies served warm.'),
(304, 30, 'Banana Split', 5.99, 'Classic banana split with three scoops of ice cream, whipped cream, and toppings.'),
(305, 30, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(301, 30, 'Mini Cheeseburger', 7.99, 'Mini cheeseburger served with fries and ketchup.'),
(302, 30, 'Chicken Quesadilla', 8.49, 'Grilled chicken and cheese folded in a tortilla, served with salsa.'),
(303, 30, 'Pasta with Marinara Sauce', 6.99, 'Pasta served with classic marinara sauce and grated Parmesan cheese.'),
(304, 30, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(305, 30, 'Grilled Cheese Sandwich', 6.99, 'Classic grilled sandwich with melted cheese.');

-- For menu ID 31
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(311, 31, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(312, 31, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(313, 31, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(314, 31, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(315, 31, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(311, 31, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(312, 31, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(313, 31, 'Water', 1.49, 'Bottled water for hydration.'),
(314, 31, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(315, 31, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(311, 31, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(312, 31, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(313, 31, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(314, 31, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(315, 31, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(311, 31, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(312, 31, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(313, 31, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(314, 31, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(315, 31, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(311, 31, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(312, 31, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(313, 31, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(314, 31, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(315, 31, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


-- For menu ID 32
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(321, 32, 'Mini Hot Dogs', 6.49, 'Mini hot dogs served with ketchup and mustard.'),
(322, 32, 'Cheese Quesadilla', 5.99, 'Grilled cheese folded in a tortilla, served with salsa.'),
(323, 32, 'Chicken Tenders', 7.49, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(324, 32, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(325, 32, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(321, 32, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(322, 32, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.'),
(323, 32, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(324, 32, 'Water', 1.49, 'Bottled water for hydration.'),
(325, 32, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(321, 32, 'French Fries', 3.99, 'Crispy golden fries served with ketchup.'),
(322, 32, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(323, 32, 'Veggie Sticks', 3.49, 'Assorted fresh vegetable sticks served with ranch dressing.'),
(324, 32, 'Garlic Bread', 3.99, 'Toasted bread rubbed with garlic and butter, perfect for dipping in marinara sauce.'),
(325, 32, 'Onion Rings', 4.99, 'Crispy battered onion rings served with ranch dressing.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(321, 32, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(322, 32, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(323, 32, 'Chocolate Chip Cookies', 3.49, 'Homemade chocolate chip cookies served warm.'),
(324, 32, 'Banana Split', 5.99, 'Classic banana split with three scoops of ice cream, whipped cream, and toppings.'),
(325, 32, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(321, 32, 'Mini Cheeseburger', 7.99, 'Mini cheeseburger served with fries and ketchup.'),
(322, 32, 'Chicken Quesadilla', 8.49, 'Grilled chicken and cheese folded in a tortilla, served with salsa.'),
(323, 32, 'Pasta with Marinara Sauce', 6.99, 'Pasta served with classic marinara sauce and grated Parmesan cheese.'),
(324, 32, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(325, 32, 'Grilled Cheese Sandwich', 6.99, 'Classic grilled sandwich with melted cheese.');

-- For menu ID 33
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(331, 33, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(332, 33, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(333, 33, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(334, 33, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(335, 33, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(331, 33, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(332, 33, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(333, 33, 'Water', 1.49, 'Bottled water for hydration.'),
(334, 33, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(335, 33, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(331, 33, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(332, 33, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(333, 33, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(334, 33, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(335, 33, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(331, 33, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(332, 33, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(333, 33, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(334, 33, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(335, 33, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(331, 33, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(332, 33, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(333, 33, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(334, 33, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(335, 33, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');

-- For menu ID 34
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(341, 34, 'Mini Hot Dogs', 6.49, 'Mini hot dogs served with ketchup and mustard.'),
(342, 34, 'Cheese Quesadilla', 5.99, 'Grilled cheese folded in a tortilla, served with salsa.'),
(343, 34, 'Chicken Tenders', 7.49, 'Breadcrumbed chicken tenders served with fries and a small side salad.'),
(344, 34, 'Macaroni and Cheese Bites', 5.99, 'Bite-sized macaroni and cheese balls, deep-fried until golden brown.'),
(345, 34, 'Peanut Butter and Jelly Roll-Ups', 4.99, 'Peanut butter and jelly rolled in a soft tortilla, sliced into bite-sized pieces.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(341, 34, 'Fruit Punch', 2.99, 'Refreshing fruit punch made with a blend of juices.'),
(342, 34, 'Lemonade', 2.49, 'Refreshing lemonade served with a slice of lemon.'),
(343, 34, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(344, 34, 'Water', 1.49, 'Bottled water for hydration.'),
(345, 34, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(341, 34, 'French Fries', 3.99, 'Crispy golden fries served with ketchup.'),
(342, 34, 'Cheese Sticks', 4.49, 'Breaded mozzarella cheese sticks served with marinara sauce.'),
(343, 34, 'Veggie Sticks', 3.49, 'Assorted fresh vegetable sticks served with ranch dressing.'),
(344, 34, 'Garlic Bread', 3.99, 'Toasted bread rubbed with garlic and butter, perfect for dipping in marinara sauce.'),
(345, 34, 'Onion Rings', 4.99, 'Crispy battered onion rings served with ranch dressing.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(341, 34, 'Ice Cream Sandwich', 4.99, 'Vanilla ice cream sandwiched between two chocolate cookies.'),
(342, 34, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(343, 34, 'Chocolate Chip Cookies', 3.49, 'Homemade chocolate chip cookies served warm.'),
(344, 34, 'Banana Split', 5.99, 'Classic banana split with three scoops of ice cream, whipped cream, and toppings.'),
(345, 34, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(341, 34, 'Mini Cheeseburger', 7.99, 'Mini cheeseburger served with fries and ketchup.'),
(342, 34, 'Chicken Quesadilla', 8.49, 'Grilled chicken and cheese folded in a tortilla, served with salsa.'),
(343, 34, 'Pasta with Marinara Sauce', 6.99, 'Pasta served with classic marinara sauce and grated Parmesan cheese.'),
(344, 34, 'Cheese Pizza', 9.99, 'Classic pizza topped with tomato sauce and mozzarella cheese.'),
(345, 34, 'Grilled Cheese Sandwich', 6.99, 'Classic grilled sandwich with melted cheese.');

-- For menu ID 35
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(351, 35, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(352, 35, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(353, 35, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(354, 35, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(355, 35, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(351, 35, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(352, 35, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(353, 35, 'Water', 1.49, 'Bottled water for hydration.'),
(354, 35, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(355, 35, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(351, 35, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(352, 35, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(353, 35, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(354, 35, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(355, 35, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(351, 35, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(352, 35, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(353, 35, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(354, 35, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(355, 35, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(351, 35, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(352, 35, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(353, 35, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(354, 35, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(355, 35, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');

-- For menu ID 36
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(361, 36, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(362, 36, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(363, 36, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(364, 36, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(365, 36, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(361, 36, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(362, 36, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(363, 36, 'Water', 1.49, 'Bottled water for hydration.'),
(364, 36, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(365, 36, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(361, 36, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(362, 36, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(363, 36, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(364, 36, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(365, 36, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(361, 36, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(362, 36, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(363, 36, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(364, 36, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(365, 36, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(361, 36, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(362, 36, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(363, 36, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(364, 36, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(365, 36, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


-- For menu ID 37
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(371, 37, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(372, 37, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(373, 37, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(374, 37, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(375, 37, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(371, 37, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(372, 37, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(373, 37, 'Water', 1.49, 'Bottled water for hydration.'),
(374, 37, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(375, 37, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(371, 37, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(372, 37, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(373, 37, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(374, 37, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(375, 37, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(371, 37, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(372, 37, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(373, 37, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(374, 37, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(375, 37, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(371, 37, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(372, 37, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(373, 37, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(374, 37, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(375, 37, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');

-- For menu ID 38
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(381, 38, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(382, 38, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(383, 38, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(384, 38, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(385, 38, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(381, 38, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(382, 38, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(383, 38, 'Water', 1.49, 'Bottled water for hydration.'),
(384, 38, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(385, 38, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(381, 38, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(382, 38, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(383, 38, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(384, 38, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(385, 38, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(381, 38, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(382, 38, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(383, 38, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(384, 38, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(385, 38, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(381, 38, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(382, 38, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(383, 38, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(384, 38, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(385, 38, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


-- For menu ID 39
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(391, 39, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(392, 39, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(393, 39, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(394, 39, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(395, 39, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(391, 39, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(392, 39, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(393, 39, 'Water', 1.49, 'Bottled water for hydration.'),
(394, 39, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(395, 39, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(391, 39, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(392, 39, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(393, 39, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(394, 39, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(395, 39, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(391, 39, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(392, 39, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(393, 39, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(394, 39, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(395, 39, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(391, 39, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(392, 39, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(393, 39, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(394, 39, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(395, 39, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');

-- For menu ID 40
INSERT INTO kidsmeal (id, menuId, item_name, price, item_description) VALUES
(401, 40, 'Mini Cheese Pizza', 5.99, 'Mini cheese pizza topped with tomato sauce and mozzarella cheese.'),
(402, 40, 'Chicken Nuggets', 6.99, 'Bite-sized chicken nuggets served with dipping sauce.'),
(403, 40, 'Macaroni and Cheese', 5.99, 'Creamy macaroni pasta with melted cheddar cheese.'),
(404, 40, 'Grilled Cheese Sandwich', 5.49, 'Classic grilled sandwich with melted cheese.'),
(405, 40, 'Fish Sticks', 6.49, 'Battered fish sticks served with tartar sauce and fries.');

INSERT INTO drinks (id, menuId, item_name, price, item_description) VALUES
(401, 40, 'Fruit Juice', 2.99, 'Selection of apple, orange, or grape juice.'),
(402, 40, 'Milk', 1.99, 'Cold milk served in a kid-friendly cup.'),
(403, 40, 'Water', 1.49, 'Bottled water for hydration.'),
(404, 40, 'Soda', 2.49, 'Choice of Coke, Pepsi, Sprite, or root beer.'),
(405, 40, 'Chocolate Milk', 2.99, 'Rich chocolate-flavored milk for a sweet treat.');

INSERT INTO appetizers (id, menuId, item_name, price, item_description) VALUES
(401, 40, 'Carrot Sticks', 3.49, 'Fresh carrot sticks served with ranch dressing for dipping.'),
(402, 40, 'Celery Sticks', 2.99, 'Crunchy celery sticks served with peanut butter.'),
(403, 40, 'Fruit Cup', 4.99, 'Assorted fresh fruits served in a cup.'),
(404, 40, 'Cheese and Crackers', 5.49, 'Assortment of cheese cubes and crackers.'),
(405, 40, 'Veggie Chips', 3.99, 'Crispy vegetable chips made from sweet potatoes, carrots, and beets.');

INSERT INTO desserts (id, menuId, item_name, price, item_description) VALUES
(401, 40, 'Ice Cream Sundae', 4.99, 'Vanilla ice cream topped with chocolate syrup and sprinkles.'),
(402, 40, 'Fruit Popsicle', 2.49, 'Refreshing fruit-flavored popsicle on a stick.'),
(403, 40, 'Brownie Bites', 3.99, 'Miniature chocolate brownies served with whipped cream.'),
(404, 40, 'Fruit Sorbet', 3.49, 'Refreshing sorbet made from fresh fruits.'),
(405, 40, 'Mini Cupcakes', 4.49, 'Assorted mini cupcakes in various flavors.');

INSERT INTO maincourse (id, menuId, item_name, price, item_description) VALUES
(401, 40, 'Peanut Butter and Jelly Sandwich', 4.99, 'Classic sandwich made with peanut butter and jelly.'),
(402, 40, 'Cheeseburger Sliders', 8.99, 'Mini cheeseburgers served with fries and ketchup.'),
(403, 40, 'Vegetable Pizza', 10.99, 'Pizza topped with assorted vegetables and mozzarella cheese.'),
(404, 40, 'Pasta with Butter', 4.49, 'Simple pasta dish tossed in butter and Parmesan cheese.'),
(405, 40, 'Chicken Tenders', 6.99, 'Breadcrumbed chicken tenders served with fries and a small side salad.');


INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES
(1, 1, 'Mexican Fiesta', 'Mexican', 'Vibrant', false, true, '00:30:00', true, true, 2.8, 10, false, 4.3, '5pm-10pm'),
(2, 2, 'Thai Spice', 'Thai', 'Relaxed', false, true, '00:25:00', true, true, 3.5, 11, false, 4.1, '6pm-9pm'),
(3, 3, 'Mediterranean Breeze', 'Mediterranean', 'Chic', true, true, '00:20:00', true, true, 1.9, 12, true, 4.4, '12pm-3pm, 7pm-10pm'),
(1, 4, 'French Delight', 'French', 'Elegant', false, true, '00:35:00', true, true, 3.2, 9, true, 4.5, '7pm-10pm'),
(2, 5, 'Indian Spice', 'Indian', 'Colorful', false, true, '00:40:00', true, true, 2.6, 10, false, 4.0, '6pm-9pm'),
(1, 6, 'Mexican Tacos', 'Mexican', 'Lively', false, true, '00:30:00', true, true, 2.8, 10, false, 4.3, '5pm-10pm'),
(2, 7, 'Thai Delight', 'Thai', 'Casual', false, true, '00:25:00', true, true, 3.5, 11, false, 4.1, '6pm-9pm'),
(3, 8, 'Mediterranean Delish', 'Mediterranean', 'Modern', true, true, '00:20:00', true, true, 1.9, 12, true, 4.4, '12pm-3pm, 7pm-10pm'),
(1, 9, 'French Cuisine', 'French', 'Sophisticated', false, true, '00:35:00', true, true, 3.2, 9, true, 4.5, '7pm-10pm'),
(2, 10, 'Indian Flavor', 'Indian', 'Energetic', false, true, '00:40:00', true, true, 2.6, 10, false, 4.0, '6pm-9pm'),
(3, 11, 'Mediterranean Feast', 'Mediterranean', 'Trendy', true, true, '00:20:00', true, true, 1.9, 12, true, 4.4, '12pm-3pm, 7pm-10pm'),
(1, 12, 'French Elegance', 'French', 'Classy', false, true, '00:35:00', true, true, 3.2, 9, true, 4.5, '7pm-10pm'),
(2, 13, 'Indian Cuisine', 'Indian', 'Vibrant', false, true, '00:40:00', true, true, 2.6, 10, false, 4.0, '6pm-9pm');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES
(1, 14, 'Italian Delights', 'Italian', 'Cozy', false, true, '00:30:00', true, true, 2.8, 10, false, 4.3, '5pm-10pm'),
(2, 15, 'Japanese Sushi Bar', 'Japanese', 'Sleek', false, true, '00:25:00', true, true, 3.5, 11, false, 4.1, '6pm-9pm'),
(3, 16, 'Chinese Wok', 'Chinese', 'Traditional', true, true, '00:20:00', true, true, 1.9, 12, true, 4.4, '12pm-3pm, 7pm-10pm'),
(1, 17, 'Greek Taverna', 'Greek', 'Authentic', false, true, '00:35:00', true, true, 3.2, 9, true, 4.5, '7pm-10pm'),
(2, 18, 'American Diner', 'American', 'Classic', false, true, '00:40:00', true, true, 2.6, 10, false, 4.0, '6pm-9pm');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES
(3, 19, 'Mexican Cantina', 'Mexican', 'Vibrant', true, true, '00:30:00', true, true, 2.1, 11, false, 4.2, '5pm-11pm'),
(1, 20, 'Mediterranean Bistro', 'Mediterranean', 'Rustic', false, true, '00:25:00', true, true, 3.8, 10, false, 4.6, '6pm-10pm'),
(2, 21, 'Thai Spice House', 'Thai', 'Elegant', false, true, '00:20:00', true, true, 2.9, 12, true, 4.3, '12pm-3pm, 6pm-10pm'),
(3, 22, 'Indian Curry House', 'Indian', 'Colorful', true, true, '00:35:00', true, true, 3.5, 9, true, 4.4, '7pm-11pm'),
(1, 23, 'French Bistro', 'French', 'Chic', false, true, '00:40:00', true, true, 2.4, 11, false, 4.1, '6pm-10pm'),
(2, 24, 'Korean BBQ Grill', 'Korean', 'Lively', false, true, '00:30:00', true, true, 3.2, 10, false, 4.5, '6pm-11pm'),
(3, 25, 'Spanish Tapas Bar', 'Spanish', 'Casual', true, true, '00:25:00', true, true, 1.7, 12, false, 4.3, '5pm-10pm'),
(1, 26, 'Vietnamese Pho Hut', 'Vietnamese', 'Relaxed', false, true, '00:20:00', true, true, 3.1, 9, true, 4.0, '11am-3pm, 6pm-9pm'),
(2, 27, 'Brazilian Steakhouse', 'Brazilian', 'Festive', false, true, '00:35:00', true, true, 2.8, 10, true, 4.6, '6pm-10pm'),
(3, 28, 'Lebanese Grill House', 'Lebanese', 'Inviting', true, true, '00:30:00', true, true, 3.6, 11, false, 4.2, '7pm-11pm'),
(1, 29, 'Irish Pub', 'Irish', 'Cozy', false, true, '00:40:00', true, true, 2.3, 12, false, 4.3, '5pm-11pm'),
(2, 30, 'African Safari Kitchen', 'African', 'Adventurous', false, true, '00:45:00', true, true, 3.4, 9, true, 4.1, '6pm-10pm'),
(3, 31, 'Russian Borscht House', 'Russian', 'Warm', true, true, '00:25:00', true, true, 1.9, 10, false, 4.5, '7pm-10pm'),
(1, 32, 'Caribbean Jerk Shack', 'Caribbean', 'Relaxing', false, true, '00:30:00', true, true, 3.0, 11, false, 4.4, '6pm-9pm'),
(2, 33, 'Australian Outback Grill', 'Australian', 'Rustic', false, true, '00:20:00', true, true, 2.7, 12, true, 4.3, '12pm-3pm, 7pm-10pm'),
(3, 34, 'Portuguese Seafood Tavern', 'Portuguese', 'Seaside', true, true, '00:35:00', true, true, 3.3, 9, true, 4.2, '7pm-11pm'),
(1, 35, 'Swiss Alpine Chalet', 'Swiss', 'Mountainous', false, true, '00:40:00', true, true, 2.2, 10, false, 4.0, '6pm-10pm'),
(2, 36, 'Peruvian Ceviche Bar', 'Peruvian', 'Lively', false, true, '00:30:00', true, true, 3.7, 11, false, 4.6, '6pm-11pm'),
(3, 37, 'Egyptian Nile Cafe', 'Egyptian', 'Historic', true, true, '00:25:00', true, true, 1.8, 12, false, 4.1, '5pm-10pm'),
(1, 38, 'Hawaiian Luau Hut', 'Hawaiian', 'Tropical', false, true, '00:20:00', true, true, 3.2, 9, true, 4.5, '11am-3pm, 6pm-9pm'),
(2, 39, 'Argentinian Parrilla Grill', 'Argentinian', 'Sizzling', false, true, '00:35:00', true, true, 2.5, 10, true, 4.2, '6pm-10pm'),
(3, 40, 'Turkish Delight Palace', 'Turkish', 'Opulent', true, true, '00:30:00', true, true, 3.9, 11, false, 4.3, '7pm-11pm');


INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES
(false, true, true, true, false),
(true, false, true, false, true),
(false, true, false, false, true),
(true, true, true, true, true),
(false, false, true, true, true),
(false, true, false, false, true),
(false, true, false, false, true),
(true, true, true, true, true),
(false, false, true, true, true),
(false, true, false, false, true),
(true, true, true, true, true),
(false, false, true, true, true),
(true, true, true, true, true),
(false, false, true, true, true),
(false, true, false, false, true),
(true, true, true, true, true),
(false, false, true, true, true);

INSERT INTO photo (name, caption) VALUES
('pizza.jpg', 'Freshly baked pepperoni pizza with melted cheese'),
('sushi.jpg', 'Assorted sushi rolls with soy sauce and wasabi'),
('burger.jpg', 'Juicy cheeseburger with lettuce, tomato, and pickles'),
('pasta.jpg', 'Homemade spaghetti with marinara sauce and meatballs'),
('steak.jpg', 'Grilled ribeye steak with garlic butter and roasted potatoes'),
('salad.jpg', 'Healthy salad with mixed greens, cherry tomatoes, and balsamic dressing'),
('smoothie.jpg', 'Refreshing fruit smoothie made with strawberries, bananas, and yogurt'),
('sushi2.jpg', 'Sashimi platter with fresh slices of tuna, salmon, and yellowtail'),
('icecream.jpg', 'Decadent ice cream sundae with chocolate sauce and whipped cream'),
('cake.jpg', 'Layered chocolate cake with raspberry filling and ganache frosting'),
('tiramisu.jpg', 'Italian tiramisu dessert with layers of coffee-soaked ladyfingers and mascarpone cream'),
('cookies.jpg', 'Homemade chocolate chip cookies fresh out of the oven'),
('sandwich.jpg', 'Grilled cheese sandwich with melted cheddar and crispy bacon'),
('sushi3.jpg', 'Nigiri sushi assortment with slices of fish over sushi rice'),
('ramen.jpg', 'Steamy bowl of ramen noodles with pork belly and soft-boiled egg'),
('pancakes.jpg', 'Fluffy buttermilk pancakes with maple syrup and butter'),
('fries.jpg', 'Crispy french fries served with ketchup and mayonnaise'),
('taco2.jpg', 'Fish tacos with cabbage slaw and creamy chipotle sauce'),
('curry.jpg', 'Vegetarian curry with chickpeas, spinach, and coconut milk'),
('pie.jpg', 'Homemade apple pie with a flaky crust and cinnamon sugar topping'),
('sushi4.jpg', 'Dragon roll sushi topped with avocado and eel sauce'),
('pho.jpg', 'Vietnamese pho soup with beef, rice noodles, and fresh herbs'),
('burrito.jpg', 'Loaded burrito with seasoned rice, beans, and grilled chicken'),
('sushi5.jpg', 'Rainbow sushi roll with a variety of colorful fish and avocado'),
('wings.jpg', 'Spicy buffalo chicken wings with celery sticks and blue cheese dressing'),
('taco3.jpg', 'Barbacoa tacos with cilantro, onions, and lime wedges'),
('pasta2.jpg', 'Creamy fettuccine Alfredo with grilled chicken and broccoli'),
('sushi6.jpg', 'Volcano roll sushi topped with spicy mayo and crunchy tempura flakes'),
('souffle.jpg', 'Chocolate soufflé with a molten lava center and powdered sugar dusting'),
('cheesecake.jpg', 'New York-style cheesecake with a graham cracker crust and cherry topping'),
('sushi7.jpg', 'Tempura shrimp sushi roll with avocado and eel sauce'),
('taco4.jpg', 'Grilled chicken tacos with fresh salsa and cotija cheese'),
('boba.jpg', 'Taro milk tea boba drink with tapioca pearls and a straw'),
('sushi8.jpg', 'Caterpillar roll sushi with thinly sliced cucumber and eel'),
('sashimi.jpg', 'Assorted sashimi slices including tuna, salmon, and yellowtail'),
('sushi9.jpg', 'Spider roll sushi filled with soft-shell crab and cucumber'),
('poke.jpg', 'Hawaiian poke bowl with marinated raw fish and sushi rice'),
('sushi10.jpg', 'Philadelphia roll sushi with smoked salmon and cream cheese'),
('pasta2.jpg', 'Creamy fettuccine Alfredo with Parmesan cheese and black pepper'),
('taco.jpg', 'Delicious tacos with seasoned ground beef, salsa, and cilantro'),
('ramen.jpg', 'Steaming bowl of Japanese ramen with pork, egg, and green onions'),
('curry.jpg', 'Spicy chicken curry with basmati rice and naan bread'),
('sushi3.jpg', 'Beautifully plated nigiri sushi with fresh fish and rice'),
('pizza2.jpg', 'Vegetarian pizza with mushrooms, bell peppers, and olives'),
('burger2.jpg', 'Double cheeseburger with crispy bacon and melted cheddar'),
('salad2.jpg', 'Greek salad with feta cheese, olives, cucumbers, and red onions'),
('steak2.jpg', 'Tender filet mignon steak cooked to perfection'),
('smoothie2.jpg', 'Tropical smoothie bowl topped with granola, coconut, and mango'),
('sushi4.jpg', 'Artfully arranged sushi rolls with avocado, cucumber, and crab'),
('taco2.jpg', 'Fish tacos with cabbage slaw and chipotle mayo in corn tortillas'),
('ramen2.jpg', 'Spicy miso ramen with tofu, bean sprouts, and corn'),
('curry2.jpg', 'Vegetable curry with chickpeas, carrots, and potatoes'),
('pizza3.jpg', 'Thin crust margherita pizza with fresh basil and mozzarella'),
('burger3.jpg', 'Classic cheeseburger with lettuce, tomato, and onion rings'),
('salad3.jpg', 'Caprese salad with ripe tomatoes, mozzarella cheese, and basil'),
('steak3.jpg', 'Succulent T-bone steak served with mashed potatoes and gravy'),
('smoothie3.jpg', 'Green smoothie packed with spinach, kale, and pineapple'),
('sushi5.jpg', 'Dragon roll sushi topped with eel and avocado slices'),
('taco3.jpg', 'Grilled chicken tacos with pico de gallo and guacamole'),
('ramen3.jpg', 'Vegetarian ramen bowl with shiitake mushrooms and bamboo shoots'),
('curry3.jpg', 'Lamb curry with fragrant spices and fluffy jasmine rice'),
('pizza4.jpg', 'BBQ chicken pizza with caramelized onions and barbecue sauce'),
('burger4.jpg', 'Gourmet burger with truffle aioli and arugula on a brioche bun'),
('salad4.jpg', 'Quinoa salad with roasted vegetables and tahini dressing'),
('steak4.jpg', 'New York strip steak seasoned with sea salt and cracked pepper');


INSERT INTO user (userID, username, password, student_bool, school_name, school_year, school_major, fName, lName, gender, age, budget, biography, locationID, photoID, dietaryID) VALUES
(1,'john_doe', 'password123', true, 'XYZ College', 2, 'Computer Science', 'John', 'Doe', 'Male', 20, 50, 'Computer science student with a passion for programming and gaming.', 1, 1, 1),
(2,'jane_smith', 'janesmith', true, 'LMN University', 3, 'Biology', 'Jane', 'Smith', 'Female', 21, 45, 'Biology major with a love for animals and nature.', 2, 2, 2),
(3,'sam_wilson', 'samwilson', true, 'ABC College', 4, 'Engineering', 'Sam', 'Wilson', 'Male', 22, 60, 'Engineering student fascinated by technology and innovation.', 3, 3, 3),
(4,'sarah_jones', 'sjones', true, 'LMN University', 2, 'English Literature', 'Sarah', 'Jones', 'Female', 20, 55, 'English literature enthusiast with a penchant for poetry.', 1, 4, 4),
(5,'michael_clark', 'mikec', true, 'PQR College', 3, 'Business Administration', 'Michael', 'Clark', 'Male', 21, 50, 'Business administration student aspiring to be an entrepreneur.', 2, 5, 5),
(6,'alex_jackson', 'alex123', true, 'XYZ College', 2, 'Psychology', 'Alex', 'Jackson', 'Male', 20, 55, 'Loves experimenting with cooking and baking', 3, 6, 6),
(7,'olivia_davis', 'odavis', false, NULL, NULL, NULL, 'Olivia', 'Davis', 'Female', 26, 65, 'Enjoys dining out with friends and family', 1, 7, 4),
(8,'william_rodriguez', 'will123', true, 'LMN University', 4, 'History', 'William', 'Rodriguez', 'Male', 23, 60, 'History buff and amateur food critic', 2, 8, 5),
(9,'sophia_martinez', 'sophie', false, NULL, NULL, NULL, 'Sophia', 'Martinez', 'Female', 29, 70, 'Passionate about sustainable and organic food', 3, 9, 8),
(10,'ethan_taylor', 'etaylor', true, 'ABC College', 3, 'English', 'Ethan', 'Taylor', 'Male', 21, 45, 'Bookworm who loves a good meal', 1, 10, 7),
(11,'ava_anderson', 'avaa', false, NULL, NULL, NULL, 'Ava', 'Anderson', 'Female', 27, 55, 'Fitness enthusiast and food lover', 2, 11, 1),
(12,'noah_gonzalez', 'noah123', true, 'PQR College', 2, 'Physics', 'Noah', 'Gonzalez', 'Male', 22, 50, 'Science nerd with a taste for fine dining', 3, 12, 2),
(13,'mia_miller', 'miamia', false, NULL, NULL, NULL, 'Mia', 'Miller', 'Female', 25, 60, 'Art lover who enjoys experimenting in the kitchen', 1, 13, 3),
(14,'logan_wilson', 'loganw', true, 'XYZ University', 4, 'Sociology', 'Logan', 'Wilson', 'Male', 24, 65, 'Social activist and foodie', 2, 14, 4),
(15,'harper_martinez', 'harper123', false, NULL, NULL, NULL, 'Harper', 'Martinez', 'Female', 28, 55, 'Travel junkie with a passion for food photography', 3, 15, 5),
(16,'liam_thompson', 'liamt', true, 'LMN College', 3, 'Economics', 'Liam', 'Thompson', 'Male', 23, 70, 'Business-minded food enthusiast', 1, 16, 6),
(17,'amelia_hernandez', 'ameliah', false, NULL, NULL, NULL, 'Amelia', 'Hernandez', 'Female', 30, 60, 'Adventure seeker always looking for new culinary experiences', 2, 17, 6),
(18,'lucas_young', 'lucasy', true, 'PQR University', 2, 'Chemistry', 'Lucas', 'Young', 'Male', 20, 50, 'Aspiring scientist with a love for cooking', 3, 18, 4),
(19,'evelyn_diaz', 'evelyn123', false, NULL, NULL, NULL, 'Evelyn', 'Diaz', 'Female', 26, 55, 'Enjoys exploring local food markets and street vendors', 1, 19, 5),
(20,'benjamin_hall', 'benhall', true, 'ABC College', 4, 'Political Science', 'Benjamin', 'Hall', 'Male', 22, 65, 'Political junkie who appreciates a good meal', 2, 2, 2),
(21,'chloe_scott', 'chloe123', false, NULL, NULL, NULL, 'Chloe', 'Scott', 'Female', 29, 60, 'Passionate about sustainable farming and food production', 3, 1, 2),
(22,'daniel_morris', 'dmorris', true, 'XYZ University', 3, 'Mathematics', 'Daniel', 'Morris', 'Male', 21, 45, 'Math geek who enjoys exploring food culture', 1, 2, 5),
(23,'zoey_rivera', 'zoeyr', false, NULL, NULL, NULL, 'Zoey', 'Rivera', 'Female', 27, 55, 'Loves experimenting with international cuisine at home', 2, 3, 1),
(24,'nathan_wright', 'nathanw', true, 'LMN College', 2, 'Art History', 'Nathan', 'Wright', 'Male', 24, 50, 'Art enthusiast who finds inspiration in culinary arts', 3, 4, 1),
(25,'ava_perez', 'avap', false, NULL, NULL, NULL, 'Ava', 'Perez', 'Female', 28, 65, 'Enjoys documenting food adventures on social media', 1, 25, 1),
(26,'willow_carter', 'willowc', true, 'PQR University', 4, 'Philosophy', 'Willow', 'Carter', 'Female', 23, 70, 'Philosophy student with a passion for gourmet cooking', 2, 6, 1),
(27,'jacob_ramirez', 'jacobr', true, 'ABC College', 3, 'Communications', 'Jacob', 'Ramirez', 'Male', 25, 55, 'Aspiring journalist with an appetite for culinary adventures', 3, 2, 1),
(28,'mia_evans', 'mia123', false, NULL, NULL, NULL, 'Mia', 'Evans', 'Female', 30, 60, 'Loves hosting dinner parties and experimenting with new recipes', 1, 28, 2),
(29,'jaxon_garcia', 'jaxong', true, 'XYZ University', 2, 'Computer Science', 'Jaxon', 'Garcia', 'Male', 22, 50, 'Tech geek with a love for all things food-related', 2, 2, 3),
(30,'grace_walker', 'grace123', true, 'XYZ College', 2, 'Chemistry', 'Grace', 'Walker', 'Female', 20, 55, 'Chemistry student with a passion for experimenting in the lab.', 2, 30, 5),
(31,'jacob_hall', 'jacobh', false, NULL, NULL, NULL, 'Jacob', 'Hall', 'Male', 28, 65, 'Tech enthusiast and foodie looking for new culinary experiences.', 3, 31, 6),
(32,'emily_lee', 'emilyl', true, 'LMN University', 3, 'Mathematics', 'Emily', 'Lee', 'Female', 21, 50, 'Mathematics major with a love for problem-solving and good food.', 1, 32, 7),
(33,'ryan_scott', 'ryans', true, 'ABC College', 4, 'Economics', 'Ryan', 'Scott', 'Male', 22, 60, 'Economics student with a knack for financial analysis and dining out.', 2, 33, 8),
(34,'mia_wright', 'miaw', false, NULL, NULL, NULL, 'Mia', 'Wright', 'Female', 25, 55, 'Art history enthusiast who enjoys exploring different cuisines.', 3, 34, 1),
(35,'daniel_king', 'kingd', true, 'PQR College', 3, 'Political Science', 'Daniel', 'King', 'Male', 21, 50, 'Passionate about politics and discovering new food spots.', 1, 35, 2),
(36,'emma_green', 'emmag', true, 'XYZ College', 2, 'Environmental Science', 'Emma', 'Green', 'Female', 20, 55, 'Environmental science student advocating for sustainable food practices.', 2, 36, 3),
(37,'ethan_wilson', 'ethanw', false, NULL, NULL, NULL, 'Ethan', 'Wilson', 'Male', 27, 65, 'Food blogger and adventure seeker always on the lookout for delicious eats.', 3, 37, 4),
(38,'ava_harris', 'avah', true, 'LMN University', 4, 'Sociology', 'Ava', 'Harris', 'Female', 23, 60, 'Sociology major with a fascination for culture and culinary traditions.', 1, 38, 5),
(39,'noah_ross', 'noahr', false, NULL, NULL, NULL, 'Noah', 'Ross', 'Male', 29, 70, 'Outdoor enthusiast who enjoys cooking meals over a campfire.', 2, 39, 6),
(40,'olivia_evans', 'oliviae', true, 'ABC College', 3, 'Art History', 'Olivia', 'Evans', 'Female', 21, 45, 'Art history student with a love for aesthetic and gastronomy.', 3, 40, 7);


INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The food was amazing!', 5, 1, 1);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The food was amazing!', 5, 1, 1);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Great service and atmosphere.', 4, 2, 2);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Delicious options for vegetarians.', 5, 3, 3);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The staff was friendly and helpful.', 4, 4, 4);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Fast delivery and hot food.', 4, 5, 5);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('A bit pricey but worth it for the quality.', 4, 6, 6);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Cozy atmosphere, perfect for a date night.', 5, 7, 7);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The portions were huge!', 5, 8, 8);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Family-friendly and great for kids.', 4, 9, 9);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Highly recommend their desserts.', 5, 10, 10);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The cocktails were creative and tasty.', 4, 11, 11);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Excellent variety on the menu.', 5, 12, 12);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Convenient location and fast service.', 4, 13, 13);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Will definitely be coming back!', 5, 14, 14);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Impressive wine selection.', 5, 15, 15);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The staff went above and beyond.', 5, 16, 16);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Unique flavors in every dish.', 5, 17, 17);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Great value for the quality of food.', 5, 18, 18);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The ambiance was relaxing and enjoyable.', 4, 19, 19);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Prompt seating and friendly hostess.', 4, 20, 20);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The food exceeded my expectations.', 5, 21, 21);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Perfect spot for a business lunch.', 4, 22, 22);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Amazing seafood options.', 5, 23, 23);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The desserts were to die for!', 5, 24, 24);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Friendly staff and quick service.', 4, 25, 25);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Great for a casual meal with friends.', 4, 26, 26);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Incredible attention to detail in every dish.', 5, 27, 27);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Perfectly cooked steaks.', 5, 28, 28);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('A hidden gem in the city.', 5, 29, 29);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The staff was knowledgeable about the menu.', 4, 30, 30);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Great for special occasions.', 5, 31, 31);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Good variety of vegetarian options.', 4, 32, 32);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The cocktails were expertly crafted.', 5, 33, 33);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Quick and efficient service.', 4, 34, 34);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Would recommend to friends and family.', 5, 35, 35);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The ambiance was romantic and charming.', 5, 36, 36);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Generous portions at reasonable prices.', 5, 37, 37);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Great for a girls night out.', 4, 38, 38);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('Excellent service from start to finish.', 5, 39, 39);
INSERT INTO rating (review, num, restaurantID, userID) VALUES ('The food was fresh and flavorful.', 5, 40, 40);

