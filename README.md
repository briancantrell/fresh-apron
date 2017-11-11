# Be sure to run webpack
Either by using foreman with the provided Procfile
`foreman run`
or
`rails s` + `webpack -w`

# Running tests
Javascript tests:
`jest --config=jest.config.json`

Ruby tests:
`rake` to run them all, or
`ruby -Itest test/presenters/two_week_planner_test.rb --name /first_day/`


# The plan
 - [x] Click "plan next week" and see new meals
 - [x] Click a scheduled meal and change the recipe
 - [x] Paste the ical link into Calendar and see scheduled meals
 - [x] Don't create duplicates

 - [x] Event shows instructions
 - [x] If the week has meals, show shopping list
 - [x] Recipe create form
 - [x] Meal event has link to recipe

 - [ ] Shopping list can be exported to dropbox in markdown format
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


