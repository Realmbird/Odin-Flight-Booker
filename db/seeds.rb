# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Airport.destroy_all
Flight.destroy_all

airports = %w[JFK DTW SFO LGA]

airports.each { |code| Airport.create(code: code) }

def rand_duration()
  rand 3600..86400
end

def rand_time(from, to = Time.now)
  Time.at(rand(from.to_f..to.to_f))
end

100.times do
  Flight.create({ arrival_id: Airport.all.sample.id, departing_id: Airport.all.sample.id, start: rand_time(2.days.ago), duration: rand_duration })
end

Flight.where('arrival_id = departing_id').delete_all