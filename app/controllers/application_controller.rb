class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do

    erb :new
  end

  get '/recipes' do
    @recipes = recipe.ApplicationController

    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipe/:id/edit' do
    @recipe = Recipe.find_by_id[:id]
    
    erb :edit
  end

end
