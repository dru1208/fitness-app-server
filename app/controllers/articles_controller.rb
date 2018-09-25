class ArticlesController < ApplicationController
  def index
    articles = Article.all.select(:title, :link)
    render json: articles
  end
end
