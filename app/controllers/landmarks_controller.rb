class LandmarksController < ApplicationController
  # allows you to view form to create a new landmark (FAILED - 10)
  #   allows you to create a new landmark (FAILED - 11)
  #   allows you to list all landmarks (FAILED - 12)
  #   allows you to see a single landmark (FAILED - 13)
  #   allows you to view the form to edit a single landmark (FAILED - 14)
  #   allows you to edit a single landmark (FAILED - 15)
  #   creates checkboxes for all the landmarks and titles created on the Figures new page (FAILED - 16)
  set :views, 'app/views/landmarks'

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/new' do
    erb :new
  end

  post '/landmarks/new' do
    @landmark = Landmark.create(params)
    redirect :"/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])

    erb :edit
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params)

    redirect :"/landmarks/#{@landmark.id}"
  end



end
