class ChordsController < ApplicationController

    get '/chords/new' do
        @numbers = params["numbers"]
        erb :'chords/create'
    end

    get '/chords/:slug' do
        @chord = Chord.find_by_slug(params[:slug])
        erb :'/chords/show'
    end

    get '/chords/:slug/delete' do
        @chord = Chord.find_by_slug(params[:slug])
        @chord.delete
        flash[:message] = "Successfully updated."
        redirect to "/users/#{current_user.slug}"
    end
end