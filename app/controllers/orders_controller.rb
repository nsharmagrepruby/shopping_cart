class OrdersController < ApplicationController
  before_action :check_authenticate_user
  
  def index
    @orders = current_user.orders 
  end   

  def show
    @order = Order.find_by(id: params[:id])
    debugger  
    render plain: "product is not available" if @order.blank?
  end

  def create
    debugger
    @order = current_user.orders.new
    if @order.save
      redirect_to order_path(@order) 
    else
      render 'invalid'
    end
  end
end