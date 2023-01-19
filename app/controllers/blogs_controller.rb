class BlogsController < ApplicationController

  before_action :require_admin, except: [ :index, :show ]

  def require_admin
    unless is_admin
      redirect_to admin_path
    end
  end

  def index
    @blogs = Blog.get_latest
  end

  def new
    if !session[:admin_id]
      redirect_to admin_path
    end
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(get_params)
    if @blog.save
      redirect_to @blog
    else
      flash[:form_error] = @blog.errors.full_messages
      redirect_to new_blog_path
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(get_params)
      redirect_to @blog
    else
      flash[:form_error] = @blog.errors.full_messages
      redirect_to new_blog_path
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

private

  def get_params
    params.require(:blog).permit( :title, :description )
  end
end