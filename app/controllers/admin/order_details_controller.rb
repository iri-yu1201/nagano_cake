class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:order_item][:order_item_id])
    @order_item.update(making_status: params[:order_item][:making_status])
    @order = @order_item.order
    if @order_item.making_status == "製作中"
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
