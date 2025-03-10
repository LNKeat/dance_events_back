puts "🌱 Seeding spices..."

event_names= ["California Balboa Classic", "International Lindy Hop Championships", "Snowball", "All The Cats Join In", "BALorado X"]
style_list= ['Lindy Hop', 'Fusion', 'Balboa', 'Collegiate Shag', 'Mixed', "St. Louis Shag"]
location_list= ["Pasadena, California", "New York, New York", "Stockholm, Sweden", "Melbourne, Australia", "Denver, CO"]
prices = [250, 300, 400, 200, 150]
location_ids= []
index = 0

location_list.each do |loc|
    l = Location.create(name: loc)
    location_ids << l.id
end

event_names.each do |event|
    event_date = (Faker::Date.between(from: '2023-01-01', to: '2024-09-25'))
    eve = Event.create(name: event, start: event_date, dance_style: style_list.sample, price: prices[index], location_id: location_ids[index])
    index += 1
end

puts "✅ Done seeding!"
