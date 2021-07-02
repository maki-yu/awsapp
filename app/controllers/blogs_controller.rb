class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blogs_url, notice: "記事「#{blog.title}」を編集しました"
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_url, notice: "記事「#{blog.title}」を削除しました"
  end

  def create
    blog = Blog.new(blog_params)
    blog.save
    redirect_to blogs_url, notice: "記事「#{blog.title}」を投稿しました"
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :article)
  end
  
end
