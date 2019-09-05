class PostsController < ApplicationController
def show
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = post.find(params[:id])
  if @post.valid?
    redirect_to_post_path(@post)
  else
    render :edit
  end
end
    
