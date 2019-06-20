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
    if @order.save
      redirect_to order_path(@order) 
    else
      render 'invalid'
    end
  end
end