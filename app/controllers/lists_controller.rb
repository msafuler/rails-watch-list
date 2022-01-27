class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      redirect_to lists_path
    end
  end

  def list_params
    params.require(:list).permit(:name, :poster_url)
  end
end
