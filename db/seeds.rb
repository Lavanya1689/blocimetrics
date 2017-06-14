
50.times do
  registered_application = RegisteredApplication.create!(
    name: Faker::Name.title,
    url: Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all

100.times do
  Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::Name.title
  )
end

puts "Seed finished"
puts "#{RegisteredApplication.count} registrations created"
puts "#{Event.count} events created"
