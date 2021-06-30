class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_item_params)
    if @order_item.making_status == 2
      @order.update(status: 2)
    elsif @order.order_items.count == @order.order_items.where(making_status: 3).count
      @order.update(status: 3)
    end
    redirect_to admin_order_path
  end

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
