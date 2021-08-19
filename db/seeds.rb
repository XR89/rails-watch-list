# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = "http://tmdb.lewagon.com/movie/top_rated"
films = URI.open(url).read
films_hash = JSON.parse(films)

puts "Creating a list of movies"

films_hash["results"].each do |movie_info|
  Movie.create!(
    title: movie_info["title"],
    overview: movie_info["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie_info["poster_path"]}",
    rating: movie_info["vote_average"]
   )
  puts "#{movie_info["title"]} was created"
end
