# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

base_url = "http://tmdb.lewagon.com"
top_movies_json = URI.open("#{base_url}/movie/top_rated").read
top_movies = JSON.parse(top_movies_json)
config_json = URI.open("#{base_url}/configuration")
config = JSON.parse(config_json.string)

top_movies["results"].each do |top_movie|
  movie = Movie.new
  movie.overview = top_movie["overview"]
  movie.title = top_movie["title"]
  movie.rating = top_movie["vote_average"]
  movie.poster_url = "#{config["images"]["base_url"]}original/#{top_movie["backdrop_path"]}"
  movie.save
end
