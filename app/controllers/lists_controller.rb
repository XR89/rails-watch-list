class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show; end

  def new
    @list = List.new
  end

  def edit; end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'list was successfully created.'
    else
      @list = List.new(list_params)
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'list was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to @list, notice: 'list was successfully destroyed.'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
