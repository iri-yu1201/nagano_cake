class OrdersController < ApplicationController
#ログインユーザーのみ閲覧可
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = Address.all
    @address = Address.new
  end

  #注文情報の確認画面

  def comfirm

    @order = Order.new(
      customer_id: current_customer.id,
      payment_method: params[:order][:payment_method],
      shipping: 800,
      biling_amount: params[:order][:biling_amount]
    )
    if params[:order][:address_select] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:address_select] == "1"
      @select = params[:order][:address_select].to_i
      @address = Address.find(@select)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_select] == "2"
      @address = Address.new
      @address.postal_code = params[:order][:postal_code]
      @address.address = params[:order][:address]
      @address.name = params[:order][:name]
      @address.customer_id = current_customer.id
      if @address.save
        @order.postal_code = @address.postal_code
        @order.name = @address.name
        @order.address = @address.address
      end
    end
  end

  #注文確定
  #カート商品の注文商品への移行
  def create
    @order = Order.new(order_params)
    @order.shipping = 800
    @order.customer_id = current_customer.id
    @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_item = @order.order_items.new
        @order_item.item_id = cart_item.item_id
        @order_item.item.name = cart_item.item.name
        @order_item.price = cart_item.item.add_tax_item_price
        @order_item.quantity = cart_item.amount
        @order_item.save
      end
    redirect_to complete_orders_path
    current_customer.cart_items.destroy_all
  end

  def complete
  end

  def index
    @orders = current_customer.orders


  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :biling_amount)
  end
end
