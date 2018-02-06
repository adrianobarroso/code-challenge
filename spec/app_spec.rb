require 'spec_helper'

describe Public do
  def app
    @app ||= Public
  end

  describe "GET '/category/:id'" do
    it "should be successful" do
      get '/category/4'
      expect(last_response).to be_ok
    end
  end

  describe "POST '/login'" do
    it "should be successful" do
      post '/login', username: 'brunoboni', password: 'empregoligadodev'
      expect(last_response.content_type).to eq "application/json"
    end

    it "shouldn't be successful" do
      post '/login', username: 'brungasg', password: 'easfasag'
      expect(last_response.content_type).to_not eq "application/json"
    end
  end
end

# describe Public do
#   def app
#     @app ||= Public
#   end
#
#   it "should get an token" do
#     post '/login', username: 'brunoboni', password: 'empregoligadodev'
#     @token = JSON.parse(last_response.body)['token']
#     binding.pry
#   end
#
#   # def app
#   #   @app ||= Api
#   # end
#
#   # describe "GET '/'" do
#     it "should be successful" do
#       get '/', authorization: "Bearer #{@token}"
#       expect(last_response).to be_ok
#     end
#   # end
# end
