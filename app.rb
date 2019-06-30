require_relative 'config/environment'

class App < Sinatra::Base
  
  configure do
    enable :sessions
    @session_hash = ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    set :session_secret, @session_hash
  end
  
  get '/' do
    erb :index
  end
  
  post '/checkout' do
    @params = params
    @session_hash << @params.item
    erb :checkout
  end
    
  
end