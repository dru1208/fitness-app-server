class ArticlesController < ApplicationController
  def create
    @article = Article.create(title: params[:title], link: params[:link], user_id: params[:user_id])
    articles = Article.select(:id, :title, :link, :created_at).where("user_id = " + params[:user_id].to_s)
    render json: articles
  end

  def index
    articles = Article.select(:id, :title, :link, :created_at).where("user_id = " + params[:user_id].to_s)
    render json: articles
  end
end
