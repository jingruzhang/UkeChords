class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'users/signup'
        else
            redirect to "/users/#{current_user.slug}"
        end
    end

    post '/signup' do
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect to "/users/#{current_user.slug}"
        else
            flash_error(@user)
            redirect to '/signup'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect to "/users/#{current_user.slug}"
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/users/#{current_user.slug}"
        else
            flash[:notice] = "Username or password invalid"
            redirect to '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
        end
        redirect to '/'
    end

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'/users/show'
    end

end