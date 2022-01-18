Set Up

Create a new Rails app named 'rolodex_challenge'.
Create the database. The output in the terminal should look like this:
Created database 'rolodex_development'
Created database 'rolodex_test'

<!-- Generate a model called Person with a first_name, last_name, and phone. All fields should be strings. -->

% rails generate model Person first_name:string last_name:string phone:string

<!-- Run a migration to set up the database. -->

% rails db:migrate

<!-- Open up Rails console. -->

Actions

<!-- Add five family members into the Person table in the Rails console. -->

Person.create first_name:'Kimberly', last_name:'Tena', phone:'619-310-2200'
Person.create([{first_name:'Luis', last_name:'Tena', phone:'619-310-9900'},
{first_name:'Francisco', last_name:'Tena', phone:'619-310-2700'},
{first_name:'Carlos', last_name:'Tena', phone:'619-310-2299'},
{first_name:'Diego', last_name:'Tena', phone:'619-310-2233'}])

<!-- Retrieve all the items in the database. -->

pp Person.all

<!-- Add yourself to the Person table. -->

Person.create first_name:'Kirk', last_name:'Wang', phone:'919-560-9999'

<!-- Retrieve all the entries that have the same last_name as you. -->

pp Person.where(last_name:'Tena')

<!-- Update the phone number of the last entry in the database. -->

newNumber = Person.last
newNumber.update phone:'555-555-5555'
Person.last.update phone:'666-555-5555'

<!-- Retrieve the first_name of the third Person in the database. -->

(Person.find 4).first_name

Stretch Challenges

<!-- Update all the family members with the same last_name as you, to have the same phone number as you. -->

Person.where(last_name:'Tena').update(phone:'999-999-9999')

<!-- Remove all family members that do not have your last_name. -->

not_tena = Person.where.not(last_name:'Tena')[0]

(Person.where.not(last_name:'Tena')[0]).destroy
