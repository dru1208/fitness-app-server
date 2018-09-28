class BlogsController < ApplicationController
  def create
    @blog = Blog.new(title: params[:title], content: params[:content], user_id: params[:user_id])
    if @blog.save
      render json: @blog
    end
  end

  def index
    blogs = Blog.select(:id, :title, :content, :created_at, :user_id).where("user_id = " + params[:user_id].to_s)
    render json: blogs
  end
end

