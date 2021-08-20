class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update]

  def index
    @lists = List.all
    @movies = Movie.all
  end

  def show
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'list was successfully created.'
    else
      @list = List.new(list_params)
      render :new
    end
  end

  # def edit; end

  # def update
  #   if @list.update(list_params)
  #     redirect_to @list, notice: 'list was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  private

  def set_list
    @list = List.find(params[:id])
    @movies = @list.movies
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
