class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new  # Add this line to instantiate the new bookmark form
  end

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
