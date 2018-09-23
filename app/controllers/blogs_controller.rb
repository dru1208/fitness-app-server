class BlogsController < ApplicationController
  def index
    blogs = Blog.all.select(:title, :content)
    render json: blogs
  end
end

