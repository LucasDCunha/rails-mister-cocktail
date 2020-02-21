require 'json'
require 'open-uri'
require 'faker'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

Dose.delete_all
puts 'Deleted all doses'

Ingredient.delete_all
puts 'Deleted all ingredients'

user['drinks'].each do |ingredient_hash|
  Ingredient.create(name: ingredient_hash['strIngredient1'].to_s)
end
puts 'created new Ingredients'

Cocktail.delete_all
puts 'Deleted all cocktail'

20.times do
  file = URI.open('https://source.unsplash.com/random')
  cocktail = Cocktail.new(name: Faker::Movies::LordOfTheRings.character)
  cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  cocktail.save!
end

puts 'Created new cocktails'

Cocktail.all.each do |cocktail|
  rand(1..5).times do
    dose = Dose.new(cocktail: cocktail, description: Faker::Movies::Hobbit.quote)
    dose.ingredient = Ingredient.all[rand(0..99)]
    dose.save!
  end
end

puts 'Added doses to cocktails'
