class OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new
    @order.save
    redirect_to comfirm_orders_path
  end

  def show
  end

  def comfire
  end

  def compleate
  end

end
