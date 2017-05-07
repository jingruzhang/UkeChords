class SongsController < ApplicationController

    get '/songs/new' do
        if logged_in?
            erb :'/songs/create'
        else
            redirect "/login"
        end
    end

    post '/songs' do
        if !params["name"].empty?
            @song = Song.find_or_create_by(:name => params["name"])
            @song.user = current_user
            @song.chord_ids = params[:chords]
            new_chords = params["chord"]["name"].select{|i| i!=nil && i.chomp!=""}
            if !new_chords.empty?
                new_chords.each do |i|
                @song.chords << Chord.find_or_create_by(:name => i.chomp)
                end
            end
            @song.save
            flash[:message] = "Successfully added song."
            redirect to "/songs/#{@song.slug}"
        else
            redirect "/songs/new"
        end
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        new_chords = params["chord"]["name"].select{|i| i!=nil && i.chomp!=""}
        if !new_chords.empty?
            new_chords.each do |i|
            @song.chords << Chord.find_or_create_by(:name => i.chomp)
            end
        end
        @song.save
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/delete' do
        @song = Song.find_by_slug(params[:slug])
        @song.delete
        flash[:message] = "Successfully deleted song."
        redirect to "/users/#{current_user.slug}"
    end
end