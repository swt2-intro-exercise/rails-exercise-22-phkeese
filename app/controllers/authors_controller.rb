class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render "new"
    end
  end

  def update
    @article = Author.find(params[:id])

    if @article.update(author_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end
