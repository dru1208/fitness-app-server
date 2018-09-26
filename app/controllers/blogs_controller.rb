class BlogsController < ApplicationController
  def create
    @blog = Blog.new(title: params[:title], content: params[:content], user_id: params[:id])
    if @blog.save
      render json: @blog
    end
  end

  def index
    blogs = Blog.all.select(:title, :content)
    render json: blogs
  end
end

