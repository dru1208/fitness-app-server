class FeedsController < ApplicationController
   def index
    articles = Article.all.select(:id, :title, :link, :created_at)
    blogs = Blog.all.select(:id, :title, :content, :created_at)
    feeds = articles + blogs
    render json: feeds
  end
end
