
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    @articles = Article.all 
    erb :new
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect to '/articles/#{@article.id}'
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    @article.save
    redirect to '/articles#/{@article.id}'
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect to '/articles'
  end

end
