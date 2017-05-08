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
                flash[:message] = "Successfully updated."
                redirect to "/users/#{current_user.slug}"
            else
               redirect to "/users/#{current_user.slug}"
            end
        else 
            redirect to "/login"
        end 
    end
end