class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(order_params)
    @total_price = (@item.add_tax_item_price)
    order.billing_amount = @total_price + @order.shipping
  end

  def update
    @order = Order.find(order_params)
    @order.update
    redirect_to admin_order_path(order.id)
  end
  
  private
  def order_params
    params.require(:order, :order_item).permit(:customer_id, :created_at, :postal_code, :address, :name, :payment_method, :status, :shipping, :item_id)
  end

end
