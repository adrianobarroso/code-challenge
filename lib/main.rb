class Api < Sinatra::Base
  use JwtAuth

  def initialize
    super
    @accounts =  ["brunoboni", "armando"]
  end

  get '/' do
    scopes, user = request.env.values_at :scopes, :user
    username = user['username']

    if scopes.include?('list') && @accounts.include?(username)
      response = RestClient.get "http://localhost:9292/db"
      cipher = Secret.new
      data = JSON.parse(cipher.decrypt(response.body))

      content_type :json
      data.to_json
    else
      halt 403
    end
  end

  post '/' do
    scopes, user = request.env.values_at :scopes, :user
    username = user['username'].to_sym

    if scopes.include?('create') && @accounts.has_key?(username)
      values = {
        title: params[:title],
        categoryid: params[:categoryid],
        expiresat: params[:expiresat]
      }

      url = 'http://localhost:9292/db'
      content_type :json
      response = RestClient.post(url, values) { |response, request, result| response }
    else
      halt 403
    end
  end

  post '/:id/activate' do
    scopes, user = request.env.values_at :scopes, :user
    username = user['username'].to_sym

    if scopes.include?('activate') && @accounts.has_key?(username)
      values = {
        id: params[:id]
      }

      url = 'http://localhost:9292/db/activate'
      content_type :json
      response = RestClient.post(url, values) { |response, request, result| response }
    else
      halt 403
    end
  end
end

class Public < Sinatra::Base

  def initialize
    super

    @logins = {
      brunoboni: 'empregoligadodev',
      armando: 'empregoligadodev'
    }
  end

  get '/category/:id' do
    response = RestClient.get "http://localhost:9292/db"
    cipher = Secret.new
    data = JSON.parse(cipher.decrypt(response.body))

    jobs = data.select { |job| job['categoryid'] == params[:id] }
    content_type :json
    {
      category_id: params[:id],
      percentage: jobs.size.fdiv(data.size)*100,
      n_of_jobs: jobs.size
    }.to_json
  end

  post '/login' do
    username = params[:username]
    password = params[:password]

    if @logins[username.to_sym] == password
      user_token = token(username)
      session['authorization'] = "Bearer #{user_token}"
      content_type :json
      { token: user_token }.to_json
    else
      halt 401
    end
  end

  def token(username)
    JWT.encode payload(username), ENV['JWT_SECRET'], 'HS256'
  end

  def payload(username)
    secret = Secret.new

    {
      exp: Time.now.to_i + 60 * 60,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      scopes: ['create', 'list', 'activate'],
      user: {
        username: username
      }
    }
  end
end
