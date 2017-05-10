class ChordsController < ApplicationController

    get '/chords/new' do
        if logged_in?
            @numbers = params["numbers"]
            erb :'chords/create'
        else
            redirect to "/login"
        end
    end

    get '/chords/:slug' do
        if logged_in?
            @chord = Chord.find_by_slug(params[:slug])
            erb :'/chords/show'
        else 
            redirect to "/login"
        end
    end

    get '/chords/:slug/delete' do
        if logged_in?
            @chord = Chord.find_by_slug(params[:slug])
            if current_user.chords.include?(@chord)
                @chord.delete
                flash[:notice] = "Successfully updated."
                redirect to "/users/#{current_user.slug}"
            else
                flash[:notice] = "Can't edit the chord added by other user."
                redirect to "/users/#{current_user.slug}"
            end
        else 
            redirect to "/login"
        end 
    end
end