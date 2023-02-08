
puts "🌱 Seeding spices..."

event_names= ["California Balboa Classic", "International Lindy Hop Championships", "Snowball", "All The Cats Join In", "Lindy Diversion"]
style_list= ['Lindy Hop', 'Fusion', 'Balboa', 'Collegiate Shag', 'Mixed']
location_list= ['Denver, Colorado', 'Los Angeles, SoCal', 'Stockholm, Sweden', 'New York, New York', 'Melbourne, Australia']
location_ids= []

location_list.each do |loc|
    l = Location.create(name: loc)
    location_ids << l.id
end

event_names.each do |event|
    event_date = (Faker::Date.between(from: '2023-01-01', to: '2024-09-25'))
    loc_id = location_ids.sample
    eve = Event.create(name: event, start: event_date, is_affordable: rand() >= 0.5 , dance_style: style_list.sample, location_id: loc_id )


end
puts "✅ Done seeding!"
