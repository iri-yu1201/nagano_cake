class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @orders = Order.find(order_params)
  end

  def update
  end

end
