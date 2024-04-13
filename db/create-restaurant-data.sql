-- creating database for restaurant

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

IN
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('North Gloriafurt', 3, '21296');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Cooperbury', 10, '99580');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('South James', 1, '61695');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Reneeburgh', 1, '54224');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Lake Jeffery', 9, '34542');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Lake Kathleen', 8, '96186');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Josephberg', 2, '77990');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Campbellfort', 1, '03811');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('South John', 9, '24392');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Taylorshire', 9, '09863');

INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'lose', 60, 'Team cost one blue.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'artist', 5, 'Every best team.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'product', 32, 'Stock heavy thousand trade attack fight heavy red.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'leg', 23, 'Meet report share relate already fine down.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'daughter', 42, 'Each picture themselves general example politics pass concern.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'life', 73, 'Bar item business accept.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'true', 82, 'Another degree leave mouth feeling race west.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'into', 97, 'Happy also not instead a rest.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'smile', 68, 'Yeah stand alone ask oil knowledge throughout beautiful.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'series', 69, 'Poor environment big everyone meeting feeling.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'federal', 65, 'Large news good employee necessary.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'popular', 35, 'Manager voice event less when reveal sense.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'vote', 18, 'Understand art recent actually pattern.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'professor', 68, 'Affect sometimes purpose per order according cold.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'image', 42, 'State color such worry its quickly responsibility.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'nearly', 35, 'War economy though blood stage.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'his', 71, 'Best court center then development deal together.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'real', 90, 'Listen similar including improve notice mention quite.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'best', 55, 'Language sound garden culture indeed short agent.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'common', 83, 'Own same sea protect minute.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'laugh', 52, 'Fill finally prevent recently guy.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'woman', 45, 'Even authority they edge picture strong piece.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'trial', 20, 'Matter management appear.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'vote', 73, 'Make partner inside machine door.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'major', 96, 'Visit dog candidate expect.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'mind', 43, 'Arrive name put not.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'develop', 89, 'Carry network give yeah stay eight series.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'understand', 95, 'Poor support sister test trip name.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'per', 25, 'Fly push opportunity personal ground girl.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'staff', 27, 'Do force see participant.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'wonder', 93, 'Various artist take include trip interview high.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'hair', 71, 'Others including stock run road again.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'dinner', 51, 'Happy themselves also because kind sport.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'they', 2, 'Wide short reveal religious.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'enter', 7, 'In sure section management policy.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'political', 7, 'Control they character unit go try happy.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'quickly', 54, 'Dream evidence ready see put.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'must', 22, 'Entire sing low vote boy subject within sit.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'that', 48, 'Upon nice paper from especially door.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'shake', 73, 'Yes walk pick return sort friend crime.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'girl', 17, 'East group wrong ground production environmental challenge.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'parent', 85, 'Focus green role success wear call.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'how', 48, 'Parent very outside family those.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'so', 15, 'Either control occur water like prepare.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'none', 81, 'List involve fish help beautiful better travel.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'within', 72, 'Music meet effect his authority wonder.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'list', 51, 'Candidate successful visit Mrs collection.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'eye', 14, 'Personal tax fact tell.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'sport', 83, 'Thank allow role scientist audience great.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'prepare', 1, 'Receive author trouble yourself.');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Buchanan LLC', 'foreign', 'event', False, True, '20:01:44', True, False, 78, 11, False, 10, '06:21 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Garcia, Cobb and Cantu', 'go', 'professional', True, True, '08:12:51', False, True, 48, 17, True, 23, '03:47 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Potter-Mcintyre', 'energy', 'house', False, False, '13:17:04', False, True, 65, 16, True, 62, '07:27 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Bryant-Smith', 'they', 'health', False, False, '17:24:20', False, True, 82, 12, False, 75, '03:25 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Boyd Ltd', 'town', 'protect', False, True, '21:23:40', False, False, 96, 13, True, 6, '09:35 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Delacruz, Wells and Barnett', 'writer', 'arrive', False, False, '13:13:07', True, False, 5, 10, True, 23, '03:10 PM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Ferguson, Young and Russell', 'woman', 'large', False, True, '14:37:36', False, False, 68, 6, False, 42, '12:57 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Wilkerson-Carey', 'together', 'time', True, False, '14:31:43', False, False, 31, 8, True, 83, '11:20 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Thompson, Price and Coleman', 'high', 'pattern', False, True, '00:31:09', False, True, 7, 18, True, 48, '09:04 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Ortiz-Smith', 'mention', 'usually', False, False, '03:08:51', True, True, 2, 16, True, 23, '12:53 PM');
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (True, True, True, True, False);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, False, True, True, False);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, True, False, True, True);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (True, False, False, True, True);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, True, True, False, True);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (True, True, False, False, False);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (True, True, True, True, False);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, True, True, False, True);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, False, True, False, False);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, False, False, False, False);
Jamies-MacBook-Pro:23f-project-boilerplate jpanct$ /usr/local/bin/python3 /Users/jpanct/Desktop/23f-project-boilerplate/db/create-sample-restaurant-data.py
INSERT INTO customers (name, address, phone_number) VALUES ('Lisa Dunn', 'USNS Sexton
FPO AE 49310', '001-931-766-1276');
INSERT INTO customers (name, address, phone_number) VALUES ('Christine Davis', '5153 Mason Walks
Kellyshire, CO 12852', '+1-589-526-4911x69565');
INSERT INTO customers (name, address, phone_number) VALUES ('Mary Rodriguez', '6960 Gilbert Heights Apt. 288
West Kevin, RI 59501', '468-879-0346');
INSERT INTO customers (name, address, phone_number) VALUES ('Alison Phelps', '09960 Jasmine Burgs Suite 857
Stewartland, SD 08634', '327-764-2739x03803');
INSERT INTO customers (name, address, phone_number) VALUES ('Ryan Myers', '61887 Reed Summit
Austinshire, WA 64242', '(622)958-6226');
INSERT INTO customers (name, address, phone_number) VALUES ('John Greene', '7067 Hernandez Club
Steventon, IA 17712', '(445)557-9589');
INSERT INTO customers (name, address, phone_number) VALUES ('Christopher Ortiz', '1642 Kirsten Brooks Suite 419
Gomezhaven, SD 11530', '(209)906-6337x928');
INSERT INTO customers (name, address, phone_number) VALUES ('Jessica Frederick', '14825 Robert Common
Nicholsberg, NV 48659', '575-991-3626x99584');
INSERT INTO customers (name, address, phone_number) VALUES ('Paige Palmer', '0299 Veronica Track
Livingstonville, MN 38230', '445-611-2864x916');
INSERT INTO customers (name, address, phone_number) VALUES ('Daniel Garcia', '92266 Joseph Pine
Smithstad, SC 72146', '(555)400-1268x5089');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Williamsberg', 7, '36565');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('South Ronald', 9, '03645');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Lake Jennifer', 7, '87554');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('North Kimberly', 7, '02715');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Port Staceymouth', 6, '73318');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('South Bryanside', 6, '46861');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Lake Mariahaven', 1, '08435');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Alexisfort', 4, '21563');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('North Henrystad', 10, '98600');
INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('Campbellfurt', 9, '61770');
INSERT INTO menu DEFAULT VALUES;
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'last', 41, 'Make into company chair reflect including Democrat pick.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'range', 74, 'Boy hit consumer world.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'compare', 19, 'Bag public your art.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'worker', 36, 'Color interesting forget mouth all risk.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'politics', 56, 'Have task budget president appear especially.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'how', 2, 'Theory this natural system per.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'talk', 15, 'Guy term song family relate travel.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'result', 91, 'Low indeed education task door option.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'year', 46, 'Build think listen my administration.');
INSERT INTO appetizers (menuId, item_name, price, item_description) VALUES (1, 'series', 39, 'Heavy fall strong describe full water.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'product', 43, 'Upon mission road task.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'think', 29, 'In decade trouble civil.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'pressure', 3, 'Raise there laugh leave task rich service.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'care', 10, 'Strategy economy charge notice method director form happen.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'former', 67, 'Its during option party person.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'PM', 96, 'Also thousand article sister skill official.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'society', 25, 'Forget reduce phone reveal get address because.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'matter', 74, 'Deal analysis a.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'experience', 47, 'Hope from candidate knowledge sing life.');
INSERT INTO drinks (menuId, item_name, price, item_description) VALUES (1, 'quickly', 48, 'News least statement certain.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'everything', 90, 'Network feel similar old degree city.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'live', 39, 'Record perhaps main partner send support word citizen.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'through', 72, 'Well short relate write.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'civil', 10, 'Quickly open language true huge.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'southern', 90, 'Film explain again ever next phone.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'media', 55, 'Strong data method indicate institution effect.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'yes', 89, 'Rich owner among enter actually.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'head', 40, 'Experience call me pressure company.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'dream', 96, 'Can wife cultural tax.');
INSERT INTO maincourse (menuId, item_name, price, item_description) VALUES (1, 'couple', 48, 'According whose rich drive almost.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'adult', 59, 'Quality edge pick create thus remain information.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'interesting', 8, 'Interview several discussion walk.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'school', 21, 'Sense along green drop between.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'into', 22, 'Sound it low country hospital between.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'his', 16, 'Yeah center deep family collection police.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'health', 38, 'Catch business often close.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'story', 51, 'Bed degree area address build side.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'address', 72, 'Ability hear peace professional section.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'peace', 0, 'Model create garden street final.');
INSERT INTO desserts (menuId, item_name, price, item_description) VALUES (1, 'adult', 54, 'Quality vote collection short mouth general.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'city', 82, 'Would kid group activity drop standard.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'add', 24, 'Traditional north matter statement.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'now', 4, 'Tell behavior senior civil nice.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'billion', 1, 'May several issue notice sing certain.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'project', 49, 'Officer attorney purpose Democrat glass people its popular.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'even', 51, 'Member senior save building central miss pretty.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'TV', 57, 'Loss position discover marriage decide song.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'purpose', 40, 'Customer management piece measure.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'but', 18, 'Stay white meet call technology soldier modern.');
INSERT INTO kidsmeal (menuId, item_name, price, item_description) VALUES (1, 'authority', 13, 'Pass window along three common.');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Bonilla, Dixon and Carlson', 'drive', 'area', True, True, '03:36:52', True, False, 66, 9, False, 86, '01:51 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Kennedy LLC', 'sound', 'defense', True, False, '22:31:14', True, True, 62, 14, True, 89, '02:17 PM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Vargas PLC', 'reveal', 'father', True, True, '11:54:08', True, False, 38, 14, False, 68, '07:54 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Diaz-Gordon', 'chair', 'rise', True, True, '19:41:23', True, False, 61, 12, True, 3, '05:17 PM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Roberson Group', 'operation', 'interest', False, False, '18:45:24', True, True, 64, 13, False, 95, '11:03 AM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Dixon-Rodriguez', 'forget', 'own', False, False, '22:19:40', True, False, 89, 8, False, 15, '02:20 PM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Hess-Baxter', 'life', 'role', True, False, '05:41:56', False, False, 48, 13, False, 70, '02:11 PM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Wilson-Lopez', 'land', 'democratic', False, True, '11:55:37', False, False, 45, 15, False, 87, '12:11 PM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Jackson Group', 'office', 'point', True, False, '02:43:04', False, True, 47, 10, True, 93, '09:12 PM');
INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, 'Allen-Bradshaw', 'little', 'add', False, False, '06:32:05', False, True, 68, 10, True, 95, '11:35 PM');
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (True, False, False, False, False);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (True, True, False, False, False);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, True, False, True, False);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (True, True, False, True, True);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, False, True, False, True);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, False, True, True, True);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (True, True, True, True, True);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, True, True, True, False);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (False, False, False, False, True);
INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES (True, True, False, False, False);