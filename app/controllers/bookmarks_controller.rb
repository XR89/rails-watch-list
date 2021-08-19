class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to list_path(@bookmark.list), notice: 'bookmark was successfully created.'
    else
      @bookmark = Bookmark.new(bookmark_params)
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmark_path, notice: 'bookmark was successfully destroyed.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:name)
  end

end
