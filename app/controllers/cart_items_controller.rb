class CartItemsController < ApplicationController

  def index
    @cart_items =  current_customer.cart_items 
    @total_price = @cart_items.sum(:price)
  end

  def create
    @cart_item = Cart_item.new
    @cart_item.price = @item.price*@cart_item.amount
    @cart_item.save
    redirect_to cart_items_path(current.id)
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

end
