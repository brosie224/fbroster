class UsersController < ApplicationController

    get "/signup" do
      redirect to '/teams' if logged_in?
      erb :'/users/create_user'
    end
    
      post "/signup" do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
          if @user.save
            session[:user_id] = @user.id
            redirect to '/teams/new'
          else
            redirect to '/signup'
          end
      end
    
      get "/login" do
        redirect to '/teams' if logged_in?
        erb :'/users/login'
      end
    
      post "/login" do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect to "/users/#{@user.id}"
        else
          redirect to '/signup'
        end
      end

      get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
      end
        
      get "/logout" do
        redirect to '/' if !logged_in?
        session.clear
        redirect to "/login"
      end

end