Challenge: Rolodex
As a developer, I have been tasked with creating a database model that will be used in a rolodex application. I want to ensure that the database behaves as expected and the necessary actions can be performed on the database instances.

Set Up

Create a new Rails app named 'rolodex_challenge'.
---- rails new rolodex_challenge -d postgresql -T
Create the database. The output in the terminal should look like this:
---- cd rolodex_challenge
Created database 'rolodex_development'
---- rails db:create
Created database 'rolodex_test'
Generate a model called Person with a first_name, last_name, and phone. All fields should be strings.
$ rails generate model Person name:string breed:string age:integer
$ rails generate model Person first_name:string last_name:string phone:string
Run a migration to set up the database.
--- rails db:migrate
Open up Rails console.

rails c

Actions

Add five family members into the Person table in the Rails console.
Person.create first_name: "Jason", last_name: "Wang", phone:"111-222-3333" 
Person.create first_name: "Raul", last_name: "Marquez", phone:"111-222-4444" 
Person.create first_name: "Kirk", last_name: "Wang", phone:"534-333-5344" 
Person.create first_name: "John", last_name: "Budd", phone:"354-799-5445" 
Person.create first_name: "Josh", last_name: "Robinson", phone:"744-755-5235" 

Retrieve all the items in the database.
----  Person.all
Add yourself to the Person table.
Person.create first_name: "Jason", last_name: "Wang", phone:"111-222-3333" 
Retrieve all the entries that have the same last_name as you.
Person.where last_name:"Wang"

Update the phone number of the last entry in the database.
josh = Person.find 5
josh.phone = "000-000-0000"
josh.save

Retrieve the first_name of the third Person in the database.
someone = Person.find 3
someone.first_name


Stretch Challenges

Update all the family members with the same last_name as you, to have the same phone number as you.
Remove all family members that do not have your last_name.