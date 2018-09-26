class BlogsController < ApplicationController
  def create
    @blog = Blog.create(title: params[:title], content: params[:content], user_id: 1)
  end

  def index
    blogs = Blog.all.select(:title, :content)
    render json: blogs
  end
end

