class ArticlesController < ApplicationController
  def create
    @article = Article.create(title: params[:title], link: params[:link], user_id: params[:id])
  end

  def index
    articles = Article.all.select(:title, :link)
    render json: articles
  end
end
