class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to admin_order_path(@order_item.order)
  end

  def order_item_params
    params.require(:order_item).permit(:making_statuses)
  end

end
