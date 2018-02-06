ENV["RACK_ENV"] ||= "development"
ENV['JWT_SECRET']='empregosecret'
ENV['JWT_ISSUER']='empregoligado.com'

ENV['KEY']='reallybigandmessyencryptionkey000111000'
ENV['IV']='reallybigandmessyencryptioniv000111000'

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
require 'pry'
require 'json'
require 'jwt'
require 'Date'
require 'csv'
require 'sinatra'
require 'rest-client'

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

Dir["./lib/**/*.rb"].each { |f| require f }
