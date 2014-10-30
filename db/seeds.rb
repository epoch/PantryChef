# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Allergy.destroy_all


User.create name: 'jam', password: 'jam', password_confirmation: 'jam'

Allergy.create allergy_name: "Dairy", api_request: "&allowedAllergy[]=396^Dairy-Free"
Allergy.create allergy_name: "Gluten", api_request: "&allowedAllergy[]=393^Gluten-Free"
Allergy.create allergy_name: "Egg", api_request: "&allowedAllergy[]=397^Egg-Free"
Allergy.create allergy_name: "Peanut", api_request: "&allowedAllergy[]=394^Peanut-Free"
Allergy.create allergy_name: "Seafood", api_request: "&allowedAllergy[]=398^Seafood-Free"
Allergy.create allergy_name: "Soy", api_request: "&allowedAllergy[]=400^Soy-Free"


