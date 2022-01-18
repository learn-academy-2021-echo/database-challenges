Setup:
\*\*\* Create a new rails application and database:

$rails new banking_app -d postgresql -T

$cd banking_app

$rails db:create

\*\*\* To run server:

$rails server

$control c to shut down server

\*\*\* Create a model for owner

- An owner has a name and address, and can have multiple credit cards:

$rails generate model Owner owner_name:string address:string

$rails db:migrate

\*\*\* Create a model for credit card

- A credit card has a number, an expiration date, and an owner

$rails generate model CreditCard number:integer expiration_date:string owner_id:integer

Challenges:
\*\*\* Create three owners and save them in the database

$rail c

$Owner.create owner_name:'David', address:'136 W. Elm Street'

^^^ Repeat command to create additional owners, using different information

\*\*\* Create a credit card in the database for each owner:
(make sure to input owner then the credit number info $$$, after)

<!-- ex.
$owner_1 = Owner.find 1

$owner_1.credit_cards.create number:999888777, expiration_date:'10/23'

$owner_1.credit_cards.create number:888777666, expiration_date:'08/24' -->

$owner_1 = Owner.find 1

$owner_2 = Owner.find 2

$owner_3 = Owner.find 3

<!-- Owner 1 -->

$owner_1.credit_cards.create number:999888777, expiration_date:'10/23'

$owner_1.credit_cards.create number:888777666, expiration_date:'08/24'

<!-- Owner 2 -->

$owner_2.credit_cards.create number:555888777, expiration_date:'11/23'

$owner_2.credit_cards.create number:000777666, expiration_date:'02/24'

<!-- Owner 3 -->

$owner_3.credit_cards.create number:444888777, expiration_date:'11/27'

$owner_3.credit_cards.create number:555777666, expiration_date:'06/23'

\*\*\* Add two more credit cards to one of the owners

Stretch Challenge:
\*\*\* Add a credit limit to each card
$rails

\*\*\* Find the total credit extended to the owner with multiple credit cards
