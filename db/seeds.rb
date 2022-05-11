puts 'Removing the restaurants...'
Restaurant.destroy_all

chefs = ["Azat","Christian","Devin","Hakuyo","Yuki","Nana","Bora","Reina","Shingo","Edmund","Tirso","James","Luis","Ricardo","Kyle","Celso","Kenji","Shunjiro",]

puts "Creating #{chefs.count} Restaurants..."
chefs.each do |name|
  Restaurant.create!(
    name: "#{name}'s #{Faker::Restaurant.name}",
    address: Faker::Address.street_address,
    rating: rand(1..5),
    category: Faker::Restaurant.type.split.first,
    chef_name: name
  )
end
puts "...created #{Restaurant.count} restaurants"
