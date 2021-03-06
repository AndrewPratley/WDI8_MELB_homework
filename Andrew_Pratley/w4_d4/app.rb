require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'

# the root - home page
get '/' do
  erb :index
end

get '/movie' do
  movie_name = params['movie_name']
  # "#{movie_name}"
  # "#{params[:movie_name]} yay"
  # binding.pry
  result = HTTParty.get("http://omdbapi.com/?t=#{movie_name}")
# binding.pry
  @title = result['Title']
  @year = result['Year']
  @rated = result['Rated']
  @released = result['Released']
  @run_time = result['Runtime']
  @genre = result['Genre']
  @director = result['Director']
  @writer = result['Writer']
  @actors = result['Actors']
  @plot = result['Plot']
  @language = result['Language']
  @country = result['Country']
  @awards = result['Awards']
  @poster = result['Poster']
  @meta_score = result['Metascore']
  @imdb_rating = result['imdbRating']
  @type = result['Type']
  @res = result['Response']

  erb :movie
end

get '/about' do
  erb :about
end
