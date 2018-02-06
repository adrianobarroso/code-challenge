class Db < Sinatra::Base

  def initialize
    super

    @repository = Repository.new
  end

  get '/' do
    @repository.data
  end

  post '/' do
    @repository.create_job(params)
    content_type :json
  end

  post '/activate' do
    id = params[:id]
    @repository.job_activate(id)
    content_type :json
  end
end
