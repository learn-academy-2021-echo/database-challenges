
**Setup**
Create a new rails application and database
    % rails new banking_app -d postgresql -T
        Webpacker successfully installed 🎉 🍰
    % rails db:create
        Created database 'banking_app_development'
        Created database 'banking_app_test'
Create a model for owner
<!-- rails generate model Owner name:string address:string credit_card:string -->
An owner has a name and address, and can have multiple credit cards
    invoke  active_record
    create    db/migrate/20220118192136_create_owners.rb
    create    app/models/owner.rb

Create a model for credit card
A credit card has a number, an expiration date, and an owner

**Challenges
Create three owners and save them in the database
Create a credit card in the database for each owner
Add two more credit cards to one of the owners