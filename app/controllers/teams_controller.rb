class TeamsController < ApplicationController

    get '/teams' do
        redirect to '/login' if !logged_in?
        @teams = Team.all
        erb :'/teams/teams'
    end

    get '/teams/new' do
        redirect to '/login' if !logged_in?
        erb :'/teams/new'
    end

    post '/teams' do
        redirect to '/login' if !logged_in?

        @team = Team.new(name: params[:name], conference: params[:conference], division: params[:division])
            if @team.save
                User.find(session[:user_id]).teams << @team
                redirect to "/teams/#{@team.id}"
            else
                redirect to '/teams/new'
            end
    end

    get '/teams/:id' do
        redirect to '/login' if !logged_in?
        @team = Team.find(params[:id])
        erb :'/teams/show_team'
    end

    get '/teams/:id/edit' do
        redirect to '/login' if !logged_in?

        @team = Team.find(params[:id])
        if @team && @team.user_id == current_user.id
            erb :'/teams/edit_team'
        else
            redirect to '/teams'
        end
    end

    patch '/teams/:id' do
        redirect to '/login' if !logged_in?

        @team = Team.find(params[:id])

        if @team && @team.user_id == current_user.id
            @team.update(name: params[:name], conference: params[:conference], division: params[:division])
            redirect to "/teams/#{@team.id}"
        else
            redirect to '/teams'
        end
    end

    delete '/teams/:id/delete' do
        redirect to '/login' if !logged_in?

        @team = Team.find_by(id: params[:id])

        @team.destroy if @team && @team.user_id == current_user.id
        redirect to '/teams'
    end
    
end