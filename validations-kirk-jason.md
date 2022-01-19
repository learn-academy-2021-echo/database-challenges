# Validations Challenges

### Create a Rails application called company_contacts. The app will have a PostgreSQL database.

```Shell
$ rails new company_contacts -d postgresql -T
$ cd company_contacts
$ rails db:create
$ bundle add rspec-rails
$ rails g rspec:install
```

### Generate a model called Account that has a username, a password, and an email.

```Shell
$ rails g model Account username:string password:string email:string
$ rails db:migrate
```

### All stories should have accompanying model specs.

## Developer Stories

### As a developer, I need username, password, and email to be required.

```Ruby
require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is valid with valid attributes' do
    jason = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    expect(jason).to be_valid
  end
  it 'must have a username' do
    jason = Account.create password: 'abc123', email: 'jman@gmail.com'
    expect(jason.errors[:username]).to_not be_empty
  end
  it 'must have a password' do
    jason = Account.create username: 'jayjay9000', email: 'jman@gmail.com'
    expect(jason.errors[:password]).to_not be_empty
  end
  it 'must have an email' do
    jason = Account.create username: 'jayjay9000', password: 'abc123'
    expect(jason.errors[:email]).to_not be_empty
  end
end
```

```Ruby
class Account < ApplicationRecord
  validates :username, :password, :email, presence: true
end
```

```Shell
# ran this command after every it block was created to get red and then green
rspec spec/models/account_spec.rb
# => Finished in 0.09252 seconds (files took 2.98 seconds to load) 4 examples, 0 failures
```

### As a developer, I need every username to be at least 5 characters long.

```Ruby
  it 'must have 5 characters in username' do
    jason = Account.create username: 'jayj', password: 'abc123', email: 'jman@gmail.com'
    expect(jason.errors[:username]).to_not be_empty
  end
```

```Ruby
validates :username, length: { minimum: 5 }
```

### As a developer, I need each username to be unique.

```Ruby
it 'must have unique usernames' do
    jason1 = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    jason2 = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    expect(jason2.errors[:username]).to_not be_empty
  end
```

```Ruby
validates :username, uniqueness: true
```

### As a developer, I need each password to be at least 6 characters long.

```Ruby
it 'must have at least 6 characters in password' do
    jason = Account.create username: 'jayjay9000', password: 'abc12', email: 'jman@gmail.com'
    expect(jason.errors[:password]).to_not be_empty
  end
```

```Ruby
  validates :password, length: { minimum: 6 }
```

### As a developer, I need each password to be unique.

```Ruby
it 'must have unique passwords' do
    jason1 = Account.create username: 'jayjay8000', password: 'abc123', email: 'jman@gmail.com'
    jason2 = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    expect(jason2.errors[:password]).to_not be_empty
  end
```

```Ruby
  validates :password, uniqueness: true
```

### As a developer, I want my Account model to have many associated Addresses.

### As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.

```Shell
$ rails g model Address street_number:integer street_name:string city:string state:string zip:integer

$ rails db:migrate
```

```Ruby
class Account < ApplicationRecord
  has_many :addresses
  validates :username, :password, :email, presence: true
  validates :username, length: { minimum: 5 }
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :password, uniqueness: true
end
```

```Ruby
class Address < ApplicationRecord
  belongs_to :account
end
```

### As a developer, I want to validate the presence of all fields on Address.

```Shell
$ rails g migration add_foreign_key_to_addresses
```

```Ruby
class AddForeignKeyToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :account_id, :integer
  end
end
```

```Shell
$ rails db:migrate
```

```Ruby
require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is valid with valid attributes' do
    jason = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    jason = jason.addresses.create street_number: 123, street_name: 'Fake st.', city: 'San Diego', state: 'CA', zip: 92111
    expect(jason).to be_valid
  end
  it 'must have a valid street number' do
    jason = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    jason = jason.addresses.create street_name: 'Fake st.', city: 'San Diego', state: 'CA', zip: 92111
    expect(jason.errors[:street_number]).to_not be_empty
  end
  it 'must have a valid street name' do
    jason = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    jason = jason.addresses.create street_number: 123, city: 'San Diego', state: 'CA', zip: 92111
    expect(jason.errors[:street_name]).to_not be_empty
  end
  it 'must have a valid city' do
    jason = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    jason = jason.addresses.create street_number: 123, street_name: 'Fake st.', state: 'CA', zip: 92111
    expect(jason.errors[:city]).to_not be_empty
  end
  it 'must have a valid state' do
    jason = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    jason = jason.addresses.create street_number: 123, street_name: 'Fake st.', city: 'San Diego', zip: 92111
    expect(jason.errors[:state]).to_not be_empty
  end
  it 'must have a valid zip' do
    jason = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    jason = jason.addresses.create street_number: 123, street_name: 'Fake st.', city: 'San Diego', state: 'CA'
    expect(jason.errors[:zip]).to_not be_empty
  end
end
```

```Ruby
class Address < ApplicationRecord
  belongs_to :account
  validates :street_number, :street_name, :city, :state, :state, :zip, presence: true
end
```

## Stretch Challenges

### As a developer, I need each Account password to have at least one number.

#### HINT: Read about custom validations in the Active Record validation docs.

```Ruby
  it 'must have a valid zip' do
    jason = Account.create username: 'jayjay9000', password: 'abc123', email: 'jman@gmail.com'
    jason = jason.addresses.create street_number: 123, street_name: 'Fake st.', city: 'San Diego', state: 'CA'
    expect(jason.errors[:zip]).to_not be_empty
  end
```

```Ruby
class PasswordValidator < ActiveModel::Validator
  def validate(record)
    unless record.password =~ /[0-9]/
      record.errors.add :password, 'Password needs at least one number.'
    end
  end
end

### this is the other custom validator we tried
# class PasswordValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value =~ /[0-9]/
#       record.errors.add attribute, (options[:message] || 'Password needs at least one number!!!')
#     end
#   end
# end
###

class Account < ApplicationRecord
  ### this is the other custom validator we tried
  # validates password: true
  ###
  include ActiveModel::Validations
  validates_with PasswordValidator
  has_many :addresses
  validates :username, :password, :email, presence: true
  validates :username, length: { minimum: 5 }
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :password, uniqueness: true
end
```

### As a developer, I want to validate that Address street_number, street_name, zip are unique for within an account.

#### HINT: Read about :scope in the Active Record validation docs.

### As a developer, I want to validate that the Address street_number and zip are numbers.

#### HINT: Read about numericality in the Active Record validation docs.

### As a developer, I want to see a custom error message that says "Please, input numbers only" if street_number or zip code are not numbers.

#### HINT: Read about message in the validation docs.
