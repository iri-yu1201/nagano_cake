class Admin::OrderDetailsController < ApplicationController

  def update
    @order_item = Order_item.find(order_item_params[:id])
    @order_item.update
    redirect_to admin_order_path(@order.id)
  end

end
