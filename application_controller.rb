require 'bundler'
Bundler.require
require_relative './models/weather_scraper.rb'

class MyApp < Sinatra::Base

  get '/' do

  	scrape = WeatherScraper.new
  	@condition = scrape.condition
  	@temp = scrape.temp
  	@temp_hi = scrape.temp_hi
  	@temp_lo = scrape.temp_lo
    erb :index
  end

end