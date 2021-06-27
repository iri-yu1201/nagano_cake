class CartItemsController < ApplicationController
  #ログインユーザーのみ閲覧可能
  before_action :authenticate_customer!

  def index
    @cart_items =  current_customer.cart_items
  end

  def create
    #ログインユーザーのカートアイテムを作成する記述
    @cart_item = current_customer.cart_items.new(item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
