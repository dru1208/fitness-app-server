class ArticlesController < ApplicationController
  def create
    @article = Article.create(title: params[:title], link: params[:link], user_id: params[:user_id])
    articles = Article.select(:id, :title, :link, :created_at).where("user_id = " + params[:user_id].to_s)
    render json: articles
  end

  def destroy
    @article = Article.find(params[:id])
    puts @article.inspect
    if @article.destroy
      articles = Article.select(:id, :title, :link, :created_at).where("user_id = " + params[:user_id].to_s)
      render json: articles
    else
      render json: false
    end
  end

  def index
    articles = Article.select(:id, :title, :link, :created_at).where("user_id = " + params[:user_id].to_s)
    render json: articles
  end
end
