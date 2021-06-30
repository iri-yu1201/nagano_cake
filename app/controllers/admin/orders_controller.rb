class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_item = OrderItem.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)
    
    if @order.status == 1
      @order_items.update(making_status: 1)
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :created_at, :status, :shipping, :item_id)
  end

end
