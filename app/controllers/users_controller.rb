class UsersController < ApplicationController

    get '/users/:id' do
      @user = User.find(params[:id])
      erb :'/users/show'
    end

    get "/signup" do
      redirect to '/teams' if logged_in?
      erb :'/users/create_user'
    end
    
      post "/signup" do
        # if params[:username] != "" && params[:email] != "" && params[:password] != ""
          @user = User.create(username: params[:username], email: params[:email], password: params[:password])
          session[:user_id] = @user.id
          redirect to '/teams'
        # else
        #   redirect to '/signup'
        # end
      end
    
      get "/login" do
        redirect to '/teams' if logged_in?
        erb :'/users/login'
      end
    
      post "/login" do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect to "/teams"
        else
          redirect to '/signup'
        end
      end
        
      get "/logout" do
        redirect to '/' if !logged_in?
        session.clear
        redirect to "/login"
      end

end