class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(:item_id)
  end

  def show
    @item =Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre, :price, :is_active)
  end

end
