class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    @customers.update(customer_params)
    redirect_to admin_customer_path(customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:id, :create_name, :create_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end
end
