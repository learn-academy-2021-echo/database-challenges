Banking Challenge
Setup
Create a new rails application and database
-- cd banking_challenges
-- rails db:create
Create a model for owner
An owner has a name and address, and can have multiple credit cards
-- rails g model Owner user_name:string user_address:string
Create a model for credit card
A credit card has a number, an expiration date, and an owner
-- rails g model CreditCard credit_number:integer expiration_date:string owner_id:integer

Challenges
Create three owners and save them in the database

class Owner < ApplicationRecord
has_many :credit_cards
end

class CreditCard < ApplicationRecord
belongs_to :owner
end

Owner.create user_name:"jason5000", user_address:"123 Linda Vista Rd San Diego CA 92111"
Owner.create user_name:"Alex9000", user_address:"345 Mission Valley Rd. San Diego CA 92123"
Owner.create user_name:"Kirk8000", user_address:"556 San Carlos Rd. San Diego CA 92120"

---

[#<Owner:0x00007f9ecf255330
id: 1,
user_name: "jason5000",
user_address: "123 Linda Vista Rd San Diego CA 92111",
created_at: Tue, 18 Jan 2022 19:27:02.484205000 UTC +00:00,
updated_at: Tue, 18 Jan 2022 19:27:02.484205000 UTC +00:00>,
#<Owner:0x00007f9ecf255178
id: 2,
user_name: "Alex9000",
user_address: "345 Mission Valley Rd. San Diego CA 92123",
created_at: Tue, 18 Jan 2022 19:28:23.570073000 UTC +00:00,
updated_at: Tue, 18 Jan 2022 19:28:23.570073000 UTC +00:00>,
#<Owner:0x00007f9ecf255088
id: 3,
user_name: "Kirk8000",
user_address: "556 San Carlos Rd. San Diego CA 92120",
created_at: Tue, 18 Jan 2022 19:29:12.123475000 UTC +00:00,
updated_at: Tue, 18 Jan 2022 19:29:12.123475000 UTC +00:00>]
Create a credit card in the database for each owner
--alex = Owner.find 2
--alex.credit_cards.create credit_number:4444, expiration_date:"10/2025"
jason = Owner.find 1
kirk = Owner.find 3
jason.credit_cards.create credit_number:5555, expiration_date:"11/2025"
kirk.credit_cards.create credit_number:7777, expiration_date:"08/2025"

Add two more credit cards to one of the owners
kirk.credit_cards.create credit_number:7778, expiration_date:"09/2025"
kirk.credit_cards.create credit_number:7779, expiration_date:"10/2025"

Stretch Challenge
Add a credit limit to each card
class AddCreditCardLimit < ActiveRecord::Migration[6.1]
def change
add_column :credit_cards, :credit_limit, :integer
end
end

Find the total credit extended to the owner with multiple credit cards
kirk=CreditCard.find 3
kirk.credit_limit = 50000
kirk.save
or
kirk.update credit_limit:80000

---

kirk1 = CreditCard.find 4
kirk1.update credit_limit: 10000 (space or no space both works)

---

kirk2 = CreditCard.find 5
kirk2.update credit_limit: 5000

---

---CreditCard.sum(:credit_limit)

(5.1ms) SELECT SUM("credit_cards"."credit_limit") FROM "credit_cards"
=> 95000
