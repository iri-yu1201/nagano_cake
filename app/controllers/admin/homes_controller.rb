class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.paginate(page: params[:page], per_page: 10)
  end

end
