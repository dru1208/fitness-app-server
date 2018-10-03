class FeedsController < ApplicationController
   def index
    articles = Article.joins(:user).select("articles.id, articles.title, articles.link, articles.created_at, users.first_name, users.profile_picture")
    blogs = Blog.joins(:user).select("blogs.id, blogs.title, blogs.content, blogs.created_at, users.first_name, users.profile_picture")
    feeds = articles + blogs
    render json: feeds
  end
end
