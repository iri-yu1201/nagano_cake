class OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  #注文確定
  #カート商品の注文商品への移行
  def create
    @order = current_customer.orders.new(order_params)
    @order.save
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |order_item|
        @order_items = @order.order_items.new
        @order_items.item_id = cart_items.item_id
        @order_items.item.name = cart_item.item.name
        @order_items.item.price = cart_item.item.add_tax_item_price
        @order_items.quantity = cart_item.amount
        @order_items.save
      end
    redirect_to complete_orders_path
    current_customer.cart_items.destroy_all
  end

  #注文情報の確認画面

  def comfirm
    @order_items = OrderItem.all
    @order = Order.new(order_params)
    @order.shipping = 800
    if params[:order][:address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:address] == "1"
      @select = params[:order][:address].to.i
      @address = Address.find(@select)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.last_name+@address.first_name
    elsif params[:order][:address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def complete

  end

  private
  def order_params
    params.require(:order).permit(:payment_method)
  end
end
