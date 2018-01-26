require 'pry'
require 'json'
require 'jwt'
require 'Date'
require 'csv'
require 'sinatra'
require 'rest-client'

require File.expand_path '../job.rb', __FILE__
require File.expand_path '../secret.rb', __FILE__
require File.expand_path '../jwt_auth.rb', __FILE__
require File.expand_path '../db.rb', __FILE__
require File.expand_path '../main.rb', __FILE__
require File.expand_path '../repository.rb', __FILE__

ENV['JWT_SECRET']='empregosecret'
ENV['JWT_ISSUER']='empregoligado.com'

ENV['KEY']='reallybigandmessyencryptionkey000111000'
ENV['IV']='reallybigandmessyencryptioniv000111000'

run Rack::URLMap.new({
  '/' => Public,
  '/jobs' => Api,
  '/db' => Db
})
