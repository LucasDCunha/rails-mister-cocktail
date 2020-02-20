require 'json'
require 'open-uri'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

Ingredient.delete_all
puts 'Deleted all ingredients'

user['drinks'].each do |ingredient_hash|
  Ingredient.create(name: ingredient_hash['strIngredient1'].to_s)
end
puts 'created new Ingredients'
