class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.save
    redirect_to admin_item_path(:item_id)
  end

end
