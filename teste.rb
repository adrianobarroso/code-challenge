require 'rest_client'
require 'JSON'

@username = "brunoboni"
@password = 'empregoligadodev'

values = {
      username: @username,
      password: @password
    }

headers = {
      :content_type => 'application/json'
    }


url = 'http://localhost:9292/login'
response = RestClient.post(url, values, headers) { |response, request, result| response }

puts response
puts response.code


# puts "List Jobs"
#
# headers = {
#       :content_type => 'application/json',
#       :authorization => "Bearer #{JSON.parse(response)['token']}"
#     }
#
#
# url = 'http://localhost:9292/jobs'
# response = RestClient.get(url, headers) { |response, request, result| response }
#
# puts response
# puts response.code

# puts "Create job"
#
# values = {
#       title: 'teste',
#       categoryid: 4,
#       expiresat: '24/11/2018'
#     }
#
# headers = {
#       :content_type => 'application/json',
#       :authorization => "Bearer #{JSON.parse(response)['token']}"
#     }
#
# url = 'http://localhost:9292/db'
# response = RestClient.post(url, values, headers) { |response, request, result| response }
#
# puts response
# puts response.code


puts "Activate job partnerid 9574"

values = {
      id: '9574'
    }

headers = {
      :content_type => 'application/json',
      :authorization => "Bearer #{JSON.parse(response)['token']}"
    }

url = 'http://localhost:9292/db/activate'
response = RestClient.post(url, values, headers) { |response, request, result| response }

puts response
puts response.code
