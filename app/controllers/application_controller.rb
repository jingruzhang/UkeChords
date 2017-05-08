require './config/environment'
require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "my_application_secret"
    enable :sessions
    use Rack::Flash

    get '/' do
        erb :index
    end

    helpers do
        def logged_in?
            !!session[:user_id]
        end

        def current_user
            User.find(session[:user_id])
        end

        def flash_error(model)
            flash[:notice] = model.errors.full_messages.join(". ")
        end
    end
end