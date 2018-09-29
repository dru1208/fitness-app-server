class BlogsController < ApplicationController
  def create
    @blog = Blog.create(title: params[:title], content: params[:content], user_id: params[:user_id])
    blogs = Blog.select(:id, :title, :content, :created_at, :user_id).where("user_id = " + params[:user_id].to_s)
    render json: blogs
  end

  def index
    blogs = Blog.select(:id, :title, :content, :created_at, :user_id).where("user_id = " + params[:user_id].to_s)
    render json: blogs
  end
end

