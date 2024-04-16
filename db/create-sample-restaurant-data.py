from faker import Faker
from faker_food import FoodProvider

# Create Faker instance
fake = Faker()
fake.add_provider(FoodProvider)

# Function to generate fake data for the customers table
def generate_customers_inserts(num_inserts):
    inserts = []
    for _ in range(num_inserts):
        name = fake.name()
        address = fake.address()
        phone_number = fake.phone_number()
        insert = f"INSERT INTO customers (name, address, phone_number) VALUES ('{name}', '{address}', '{phone_number}');"
        inserts.append(insert)
    return inserts

# Function to generate fake data for the location table
def generate_location_inserts(num_inserts):
    inserts = []
    for _ in range(num_inserts):
        city_name = fake.city()
        num_restaurants = fake.random_int(min=1, max=10)
        zipcode = fake.zipcode()
        insert = f"INSERT INTO location (city_name, num_restaurants, zipcode) VALUES ('{city_name}', {num_restaurants}, '{zipcode}');"
        inserts.append(insert)
    return inserts

# Function to generate fake data for the menu table
def generate_menu_inserts(num_inserts):
    inserts = []
    for _ in range(num_inserts):
        insert = "INSERT INTO menu DEFAULT VALUES;"
        inserts.append(insert)
    return inserts

# Function to generate fake data for the appetizers, drinks, maincourse, desserts, and kidsmeal tables
def generate_item_inserts(table_name, num_inserts):
    inserts = []
    for _ in range(num_inserts):
        item_name = fake.dish()
        price = fake.random_number(digits=2)
        item_description = fake.dish_description()
        insert = f"INSERT INTO {table_name} (menuId, item_name, price, item_description) VALUES (1, '{item_name}', {price}, '{item_description}');"
        inserts.append(insert)
    return inserts

# Function to generate fake data for the restaurant table
def generate_restaurant_inserts(num_inserts):
    inserts = []
    for _ in range(num_inserts):
        restaurant_name = fake.company()
        cuisine_type = fake.word()
        atmosphere_type = fake.word()
        on_campus_bool = fake.boolean()
        allergy_friendly_bool = fake.boolean()
        present_wait_time = fake.time(pattern='%H:%M:%S')
        delivery_bool = fake.boolean()
        take_out_bool = fake.boolean()
        distance_from_user = fake.random_number(digits=2)
        hours_of_operation = fake.random_int(min=6, max=18)
        reservation_required_bool = fake.boolean()
        avg_rating = fake.random_number(digits=2)
        peak_hours = fake.time(pattern='%I:%M %p')
        insert = f"INSERT INTO restaurant (locationId, menuId, restaurant_name, cuisine_type, atmosphere_type, on_campus_bool, allergy_friendly_bool, present_wait_time, delivery_bool, take_out_bool, distance_from_user, hours_of_operation, reservation_required_bool, avg_rating, peak_hours) VALUES (1, 1, '{restaurant_name}', '{cuisine_type}', '{atmosphere_type}', {on_campus_bool}, {allergy_friendly_bool}, '{present_wait_time}', {delivery_bool}, {take_out_bool}, {distance_from_user}, {hours_of_operation}, {reservation_required_bool}, {avg_rating}, '{peak_hours}');"
        inserts.append(insert)
    return inserts

# Function to generate fake data for the dietary_restrictions table
def generate_dietary_restrictions_inserts(num_inserts):
    inserts = []
    for _ in range(num_inserts):
        nuts_bool = fake.boolean()
        vegetarian_bool = fake.boolean()
        gluten_bool = fake.boolean()
        eggs_bool = fake.boolean()
        dairy_bool = fake.boolean()
        insert = f"INSERT INTO dietary_restrictions (nuts_bool, vegetarian_bool, gluten_bool, eggs_bool, dairy_bool) VALUES ({nuts_bool}, {vegetarian_bool}, {gluten_bool}, {eggs_bool}, {dairy_bool});"
        inserts.append(insert)
    return inserts

# Function to generate fake data for the photo table
def generate_photo_inserts(num_inserts):
    inserts = []
    for _ in range(num_inserts):
        name = fake.file_name()
        caption = fake.sentence()
        insert = f"INSERT INTO photo (name, caption) VALUES ('{name}', '{caption}');"
        inserts.append(insert)
    return inserts

# Function to generate fake data for the user table
def generate_user_inserts(num_inserts):
    inserts = []
    for _ in range(num_inserts):
        username = fake.user_name()
        password = fake.password()
        student_bool = fake.boolean()
        school_name = fake.company()
        school_year = fake.random_int(min=1, max=4)
        school_major = fake.job()
        fName = fake.first_name()
        lName = fake.last_name()
        gender = fake.random_element(elements=('Male', 'Female'))
        age = fake.random_int(min=18, max=40)
        budget = fake.random_number(digits=4)
        biography = fake.paragraph()
        locationID = fake.random_int(min=1, max=num_inserts)
        photoID = fake.random_int(min=1, max=num_inserts)
        dietaryID = fake.random_int(min=1, max=num_inserts)
        insert = f"INSERT INTO user (username, password, student_bool, school_name, school_year, school_major, fName, lName, gender, age, budget, biography, locationID, photoID, dietaryID) VALUES ('{username}', '{password}', {student_bool}, '{school_name}', {school_year}, '{school_major}', '{fName}', '{lName}', '{gender}', {age}, {budget}, '{biography}', {locationID}, {photoID}, {dietaryID});"
        inserts.append(insert)
    return inserts

# Function to generate fake data for the rating table
def generate_rating_inserts(num_inserts, num_restaurants, num_users):
    inserts = []
    for _ in range(num_inserts):
        review = fake.paragraph()
        num_rating = fake.random_int(min=1, max=5)
        restaurantID = fake.random_int(min=1, max=num_restaurants)
        userID = fake.random_int(min=1, max=num_users)
        insert = f"INSERT INTO rating (review, num, restaurantID, userID) VALUES ('{review}', {num_rating}, {restaurantID}, {userID});"
        inserts.append(insert)
    return inserts

# Example usage
num_inserts = 10

# Generate insert statements for each table
customers_inserts = generate_customers_inserts(num_inserts)
location_inserts = generate_location_inserts(num_inserts)
menu_inserts = generate_menu_inserts(1)
appetizers_inserts = generate_item_inserts("appetizers", num_inserts)
drinks_inserts = generate_item_inserts("drinks", num_inserts)
maincourse_inserts = generate_item_inserts("maincourse", num_inserts)
desserts_inserts = generate_item_inserts("desserts", num_inserts)
kidsmeal_inserts = generate_item_inserts("kidsmeal", num_inserts)
restaurant_inserts = generate_restaurant_inserts(num_inserts)
dietary_restrictions_inserts = generate_dietary_restrictions_inserts(num_inserts)

all_inserts = [
    customers_inserts,
    location_inserts,
    menu_inserts,
    appetizers_inserts,
    drinks_inserts,
    maincourse_inserts,
    desserts_inserts,
    kidsmeal_inserts,
    restaurant_inserts,
    dietary_restrictions_inserts,
]

for inserts in all_inserts:
    for insert in inserts:
        print(insert)
