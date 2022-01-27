class BookmarksController < ApplicationController
  before_action :find_movie, :find_list, except: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end

end
