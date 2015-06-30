# SampleApp.rb
#
require 'sinatra'

class SampleApp < Sinatra::Base
  enable :method_override
  enable :sessions
  set :session_secret, 'randomstring'

  configure do
    set :app_file, __FILE__
  end

  configure :development do
	enable :logging, :dump_errors, :raise_errors
  end

  configure :produciton do
    set :raise_errors, false
	set :show_exceptions, false
  end

  before do
	session[:csrf] ||= Rack::Protection::Base.new(self).random_string
  end

  ####################################
  # The main routes

  get '/' do
    "SampleApp is running"
  end

end
