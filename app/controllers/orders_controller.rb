class OrdersController < ApplicationController
def index
    render plain: '123'
  end   

  def show
  end

  def create
    current_user.cart.cart_products.each do ||

    end
  end
end
