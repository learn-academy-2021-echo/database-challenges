$ rails new company_contacts -d postgresql -T
$ rails db:create
$ bundle add rspec-rails
$ rails generate rspec:install
$ rails g model Account user_name:string password:string email:string

require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is valid with valid attributes' do
    user1 = Account.create user_name: 'Zoe1412', password: 'welcome', email: 'dog@dog.com'
    expect(user1).to be_valid
  end
  it 'is not valid without a user_name, password, and email' do
    user1 = Account.create
    expect(user1.errors[:user_name]).to_not be_empty
    expect(user1.errors[:email]).to_not be_empty
    expect(user1.errors[:password]).to_not be_empty
  end
end


class Account < ApplicationRecord
  validates :user_name, :email, :password, presence: true
end

$ rspec spec/models/account_spec.rb

added to rspec file "it 'is not valid if user_name is less than 5 characters' do
  user1 = Account.create user_name: 'Zoe1', password: 'welcome', email: 'dog@dog.com'
  expect(user1.errors[:user_name]).to_not be_empty
end"

validates :user_name, length: { minimum: 5 }

require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is valid with valid attributes' do
    user1 = Address.create street_number: 123, street_name: 'Main', city: 'San Diego', state: 'California', zip: 92104
    expect(user1).to be_valid
  end
end

class Address < ApplicationRecord
validates :street_number, :street_name, :city, :state, :zip, presence: true
end
