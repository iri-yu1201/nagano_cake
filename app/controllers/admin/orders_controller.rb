class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "入金確認"
      @order.order_items.each do |order_item|
        if order_item.making_status == "製作不可"
          order_item.update(making_status: 1)
        end
      end
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :created_at, :status, :shipping, :item_id)
  end

end
