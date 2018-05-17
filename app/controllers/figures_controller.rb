class FiguresController < ApplicationController
  #   allows you to view form to create a new figure (FAILED - 1)
  #   allows you to create a new figure with a title (FAILED - 2)
  #   allows you to create a new figure with a landmark (FAILED - 3)
  #   allows you to create a new figure with a new title (FAILED - 4)
  #   allows you to create a new figure with a new landmark (FAILED - 5)
  #   allows you to list all figures (FAILED - 6)
  #   allows you to see a single Figure (FAILED - 7)
  #   allows you to view form to edit a single figure (FAILED - 8)
  #   allows you to edit a single figure (FAILED - 9)

  set :views, 'app/views/figures'

  get '/figures' do
    @figures = Figure.all
    # binding.pry
    erb :index
  end

  #new
  get '/figures/new' do
    @titles = Title.all

    erb :new
  end

  #show one figure
  get '/figures/:id' do
    @figure = Figure.all.find(params["id"])

    erb :show
  end

  post '/figures/new' do
    @figure = Figure.create(params["figure"])

    params["title"].each do |title|
      t = Title.find_by(name: title["name"])
      @figure.titles << t
    end

    # binding.pry
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do

    erb :edit
  end

  post '/figures/:id/edit' do

    erb :show
  end



end
