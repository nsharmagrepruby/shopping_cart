class OrdersController < ApplicationController
  before_action :check_authorization_user
  
  def index
    @orders = Order.where(user_id: current_user) 
  end   

  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    @order = current_user.orders.new
    @order.save
    redirect_to user_order_path(current_user, @order) 
  end  
end