require 'bundler'
Bundler.require
require_relative './models/weather_scraper.rb'
require_relative './models/cnn-headline-scraper.rb'
require_relative './models/sports_scraper.rb'

class MyApp < Sinatra::Base

  get '/' do

  	scrape = WeatherScraper.new
  	@condition = scrape.condition
  	@temp = scrape.temp
  	@temp_hi = scrape.temp_hi
  	@temp_lo = scrape.temp_lo
	
	scrape = Headlinescraper.new
    	@fixed_headlines = scrape.fixed_headlines

  sportsscrape=Sportsheadlines.new
    @sportsscrape=sportsscrape.parts

    erb :index
  end



end
