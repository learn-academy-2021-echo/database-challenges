Set Up

    <!-- Create a new Rails app named 'rolodex_challenge'.  -->
    Create the database. The output in the terminal should look like this:

    Created database 'rolodex_development'
    Created database 'rolodex_test'

        learnacademy@LEARNs-MacBook-Air rolodex_challenge % rails db:create
        Running via Spring preloader in process 71896
        Created database 'rolodex_challenge_development'
        Created database 'rolodex_challenge_test'

    Generate a model called Person with a first_name, last_name, and phone. All fields should be strings.
    Run a migration to set up the database.
    Open up Rails console.

Actions

    Add five family members into the Person table in the Rails console.

    Person.create first_name: "Christopher", last_name: "Hickey", phone: 5556610
    Person.create first_name: "Robert", last_name: "Calpito", phone: 5592886
    Person.create last_name: "dog", first_name: "Zoey", phone: 5555555
    Person.create first_name: "Michelle", last_name: "Claudio", phone: 5552476
    Person.create first_name: "Jessica", last_name: "Pham", phone: 5525555Per

    Retrieve all the items in the database.

Person.all
  Person Load (7.4ms)  SELECT "people".* FROM "people" /* loading for inspect */ LIMIT $1  [["LIMIT", 11]]
 => #<ActiveRecord::Relation [#<Person id: 1, first_name: "Christopher", last_name: "Hickey", phone: 5556610, created_at: "2022-01-14 17:41:46.057841000 +0000", updated_at: "2022-01-14 17:41:46.057841000 +0000">, #<Person id: 2, first_name: "Robert", last_name: "Calpito", phone: 5592886, created_at: "2022-01-14 17:42:23.245182000 +0000", updated_at: "2022-01-14 17:42:23.245182000 +0000">, #<Person id: 3, first_name: "Zoey", last_name: "dog", phone: 5555555, created_at: "2022-01-14 17:43:58.975977000 +0000", updated_at: "2022-01-14 17:43:58.975977000 +0000">, #<Person id: 4, first_name: "Jessica", last_name: "Pham", phone: 5525555, created_at: "2022-01-14 17:44:43.024849000 +0000", updated_at: "2022-01-14 17:44:43.024849000 +0000">, #<Person id: 5, first_name: "Michelle", last_name: "Claudio", phone: 5552476, created_at: "2022-01-14 17:45:11.934023000 +0000", updated_at: "2022-01-14 17:45:11.934023000 +0000">]> 


    Add yourself to the Person table.
    Retrieve all the entries that have the same last_name as you.

3.0.0 :015 > Person.create first_name: "Chris", last_name: "Calpito", phone: 235929

3.0.0 :016"> Person.where last_name: "Calpito"
  Person Load (0.7ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" = $1 /* loading for inspect */ LIMIT $2  [["last_name", "Calpito"], ["LIMIT", 11]]
 => #<ActiveRecord::Relation [#<Person id: 2, first_name: "Robert", last_name: "Calpito", phone: 5592886, created_at: "2022-01-14 17:42:23.245182000 +0000", updated_at: "2022-01-14 17:42:23.245182000 +0000">, #<Person id: 7, first_name: "Chris", last_name: "Calpito", phone: 235929, created_at: "2022-01-14 17:50:09.310181000 +0000", updated_at: "2022-01-14 17:50:09.310181000 +0000">]> 
3.0.0 :017 > 

    Update the phone number of the last entry in the database.

    chris_calpito = Person.find 7
    chris_calpito.phone = 2839492
    chris_calpito.save

    Retrieve the first_name of the third Person in the database.
    third_person = Person.find 3
    third_person.first_name

Stretch Challenges

    Update all the family members with the same last_name as you, to have the same phone number as you.
    Remove all family members that do not have your last_name.
