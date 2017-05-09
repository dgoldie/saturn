# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pp "Running Seeds"

User.destroy_all
doug = User.create!(name: 'Doug Goldie', email: 'dgoldie15@gmail.com',
                    profile: {"auth": 123, "finished": true})
sean = User.create!(name: 'Sean Goldie', email: 'sean@example.com')
edward = User.create!(name: 'Edward', email: 'edward@example.com')
frank = User.create!(name: 'Frank', email: 'frank@example.com')


pp 'Users loaded'
pp User.all.inspect

pp "Sean exists = #{sean.inspect}"
pp "sean's events = #{sean.broadcast_events.inspect}"

Event.destroy_all
pp "Creating events"
met_event = sean.broadcast_events.create!( title: 'Sean at the Met',
                               start: DateTime.new(2017, 5, 7, 19),
                               end:   DateTime.new(2015, 5, 7, 21) )

met_event.viewers << doug

puts "created event: #{Event.all.inspect}"
puts "met event broadcaster: #{met_event.broadcaster.name}"
puts "met event viewers: #{met_event.viewers.map(&:name)}"
puts ""


