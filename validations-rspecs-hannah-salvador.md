Validations Challenges
Create a Rails application called company_contacts. The app will have a PostgreSQL database.

rails new company_contacts_app -d postgresql -T
cd company_contacts_app
rails db:create
bundle add rspec-rails %---This adds dependencies for rspec
rails generate rspec:install %---This initiate rspec to rails

$$


Generate a model called Account that has a username, a password, and an email.



rails g model Account username:string password:integer email:string
rails db:migrate
$$

All stories should have accompanying model specs.
Developer Stories

As a developer, I need username, password, and email to be required.

it 'need username, password, and email to be required.' do
my_account = Account.create password: 24353, email: 'laters@yahoo.com'
expect(my_account.errors[:username]).to_not be_empty
end

rspec spec/models/account_spec.rb

//Fail because username does not exist
Failure/Error: expect(my_account.errors[:username]).to_not be_empty
expected `#<ActiveModel::DeprecationHandlingMessageArray([])>.empty?` to be falsey, got true

it 'need username, password, and email to be required.' do
my_account = Account.create username: 'davis', email: 'laters@yahoo.com'
expect(my_account.errors[:password]).to_not be_empty
end

it 'need username, password, and email to be required.' do
my_account = Account.create username: 'davis', password: 33333
expect(my_account.errors[:email]).to_not be_empty
end

As a developer, I need every username to be at least 5 characters long.

it 'need username to be 5 characters' do
my_account = Account.create username: 'Maz', password: 24353, email: 'laters@yahoo.com'
expect(my_account.errors[:username]).to_not be_empty
end
validates :username, length: { minimum: 5 }

$$

As a developer, I need each username to be unique.
  it 'does not allow duplicate username' do
    Account.create(username: 'Dana Scully', password: 2533553, email: 'dscully@fbi.gov')
    scully = Account.create(username: 'Dana Scully', password: 2533553, email: 'dscully@fbi.gov')
    expect(scully.errors[:username]).to_not be_empty
  end
validates :username, uniqueness: true
$$

As a developer, I need each password to be at least 6 characters long.
it 'password must be 6 characters long' do
my_account = Account.create username: 'Madazem', password: 243, email: 'laters@yahoo.com'
expect(my_account.errors[:password]).to_not be_empty
end
validates :password, length: { minimum: 6 }

$$


As a developer, I need each password to be unique.

  it 'does not allow duplicate password' do
    Account.create(username: 'Dana Scullx', password: 2533553, email: 'dscully@fbi.gov')
    scully = Account.create(username: 'Dana Scully', password: 2533553, email: 'dscully@fbi.gov')
    expect(scully.errors[:password]).to_not be_empty
  end
 validates :username, :password, uniqueness: true


As a developer, I want my Account model to have many associated Addresses.

rails generate model Addresses street_number:integer street_name:string city:string zip:integer


As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
As a developer, I want to validate the presence of all fields on Address.
Stretch Challenges

As a developer, I need each Account password to have at least one number.
HINT: Read about custom validations in the Active Record validation docs.
As a developer, I want to validate that Address street_number, street_name, zip are unique for within an account.
HINT: Read about :scope in the Active Record validation docs.
As a developer, I want to validate that the Address street_number and zip are numbers.
HINT: Read about numericality in the Active Record validation docs.
As a developer, I want to see a custom error message that says "Please, input numbers only" if street_number or zip code are not numbers.
HINT: Read about message in the validation docs.


$$

$$
$$
