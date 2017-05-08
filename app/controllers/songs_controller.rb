class SongsController < ApplicationController

    get '/songs/new' do
        if logged_in?
            erb :'/songs/create'
        else
            redirect "/login"
        end
    end

    post '/songs' do
        @song = current_user.songs.build(params[:song])
        if @song.save
            new_chords = params["chord"]["name"].select{|i| i!=nil && i.strip!=""}
            if !new_chords.empty?
                new_chords.each do |i|
                    if !@song.chords.include?(Chord.find_by(name: i.strip))
                        @song.chords << Chord.find_or_create_by(name: i.strip)
                        @song.save
                    end
                flash[:notice] = "Invalid chords input"
                end
            end
            flash[:notice] = "Successfully added song."
            redirect to "/songs/#{@song.slug}"
        else
            flash[:notice] = "Must have a valid song name."
            redirect "/songs/new"
        end
    end

    get '/songs/:slug' do
        if logged_in?
            @song = current_user.songs.find_by_slug(params[:slug])
            erb :'/songs/show'
        else 
            redirect to "/login"
        end
    end

    get '/songs/:slug/edit' do
        if logged_in?
            @song = current_user.songs.find_by_slug(params[:slug])
            if current_user.songs.include?(@song)
                erb :'/songs/edit'
            else
                flash[:notice] = "#{@song.name} is not your song. "
                redirect to "/users/#{current_user.slug}"
            end
        else
            redirect "/login"
        end
    end

    patch '/songs/:slug' do
        @song = current_user.songs.find_by_slug(params[:slug])
        @song.update(params[:song])
        new_chords = params["chord"]["name"].select{|i| i!=nil && i.strip!=""}
        if !new_chords.empty?
            new_chords.each do |i|
                if !@song.chords.include?(Chord.find_by(name: i.strip))
                    @song.chords << Chord.find_or_create_by(name: i.strip)
                    @song.save
                end
            end
        end
        @song.save
        flash[:notice] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/delete' do
        if logged_in?
            @song = current_user.songs.find_by_slug(params[:slug])
            if current_user.songs.include?(@song)
                @song.delete
                flash[:notice] = "Successfully deleted song."
                redirect to "/users/#{current_user.slug}"
            else
                flash[:notice] = "#{@song.name} is not your song. "
                redirect to "/users/#{current_user.slug}"
            end
        else
            redirect "/login"
        end
    end
end