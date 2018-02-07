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
    context 'give good credentials' do
      it "should be successful" do
        post '/login', username: 'brunoboni', password: 'empregoligadodev'
        expect(last_response.content_type).to eq "application/json"
      end
    end
    context 'give wrong credentials' do
      it "shouldn't be successful" do
        post '/login', username: 'brungasg', password: 'easfasag'
        expect(last_response.content_type).to_not eq "application/json"
      end
    end
  end
end
