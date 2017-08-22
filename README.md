# Running tests
`jest --config=jest.config.json`

# The plan
 - [x] Click "plan next week" and see new meals
 - [x] Click a scheduled meal and change the recipe
 - [x] Paste the ical link into Calendar and see scheduled meals
 - [x] Don't create duplicates

 - [x] Event shows instructions
 - [x] If the week has meals, show shopping list
 - [x] Recipe create form

 - [ ] Meal event has link to recipe
 - [ ] Shopping event has link to checkable shopping list 
 - [ ] Shopping list exports to Wunderlist

 - [ ] Use attributes API to standardize measurements, i.e. user inputs recipe ingredient as "2 cups water", stored in DB as 32 oz

# Things that might happen some day
 - [x] Authentication (https://github.com/halogenandtoast/monban ?)

# Object Design
Schedule
  - Days to schedule
  - User

Meals
  - Recipe
  - Time


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
