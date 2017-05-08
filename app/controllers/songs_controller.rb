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
            @song = Song.find_or_create_by(name: params["name"])
            @song.user = current_user
            @song.chord_ids = params[:chords]
            new_chords = params["chord"]["name"].select{|i| i!=nil && i.chomp!=""}
            if !new_chords.empty?
                new_chords.each do |i|
                    if !current_user.chords.detect {|c| c.name == i.chomp}
                        @song.chords << Chord.find_or_create_by(name: i.chomp)
                    else
                        flash[:message] = "Please check your input. Make sure you don't enter existing chords as new chords."
                        redirect to "/songs/new"
                    end
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
        if logged_in?
            @song = Song.find_by_slug(params[:slug])
            erb :'/songs/show'
        else 
            redirect to "/login"
        end
    end

    get '/songs/:slug/edit' do
        if logged_in?
            @song = Song.find_by_slug(params[:slug])
            if current_user.songs.include?(@song)
                erb :'/songs/edit'
            else
                flash[:message] = "#{@song.name} is not your song. "
                redirect to "/users/#{current_user.slug}"
            end
        else
            redirect "/login"
        end
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        new_chords = params["chord"]["name"].select{|i| i!=nil && i.chomp!=""}
        if !new_chords.empty?
            new_chords.each do |i|
                @song.chords << Chord.find_or_create_by(name: i.chomp)
            end
        end
        @song.save
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/delete' do
        if logged_in?
            @song = Song.find_by_slug(params[:slug])
            if current_user.songs.include?(@song)
                @song.delete
                flash[:message] = "Successfully deleted song."
                redirect to "/users/#{current_user.slug}"
            else
                flash[:message] = "#{@song.name} is not your song. "
                redirect to "/users/#{current_user.slug}"
            end
        else
            redirect "/login"
        end
    end
end