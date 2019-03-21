class PlayersController < ApplicationController

    get '/players' do
        redirect to '/login' if !logged_in?
        @players = Player.all
        erb :'/players/players'
    end

    get '/players/new' do
        redirect to '/login' if !logged_in?
        @teams = Team.all
        erb :'/players/new'
    end

    post '/players' do
        redirect to '/login' if !logged_in?

        @player = Player.new(first_name: params[:first_name], last_name: params[:last_name], position: params[:position], espnid: params[:espnid], team_id: params[:team_id])
            if @player.save
                redirect to "/players/#{@player.id}"
            else
                redirect to '/players/new'
            end
    end

    get '/players/:id' do
        redirect to '/login' if !logged_in?
        @player = Player.find_by(id: params[:id])
        erb :'/players/show_player'
    end

    get '/players/:id/edit' do
        redirect to '/login' if !logged_in?

        @teams = Team.all
        @player = Player.find(params[:id])
        if @player && @player.team.user_id == current_user.id
            erb :'/players/edit_player'
        else
            redirect to '/players'
        end
    end

    patch '/players/:id' do
    
        redirect to '/login' if !logged_in?

        @player = Player.find_by(id: params[:id])

        if @player && @player.team.user_id == current_user.id
            @player.update(first_name: params[:first_name], last_name: params[:last_name], position: params[:position], espnid: params[:espnid], team_id: params[:team_id])
            redirect to "/players/#{@player.id}"
        else
            redirect to '/players'
        end
    end

    delete '/players/:id/delete' do
        redirect to '/login' if !logged_in?

        @player = Player.find_by(id: params[:id])

        @player.destroy if @player && @player.team.user_id == current_user.id
        redirect to '/players'
    end

end