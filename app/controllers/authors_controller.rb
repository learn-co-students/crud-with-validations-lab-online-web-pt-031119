class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
  @author = Author.create(author_params)

  if @author.valid?
    redirect_to_author_path(@author)
  else
    render.new
  end
end

private
