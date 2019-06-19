class AddressesController < ApplicationController
  before_action :check_authorization_user
  before_action :get_address, only: [:edit, :update, :destroy]
  
  def index
  end

  def new
    @address = Address.new
  end

  def edits
  end

  def create
    if current_user.addresses.create(address_params)
      redirect_to user_addresses_path(current_user)
    else
      render 'new'
    end
  end

  def update
    if @address.update(address_params)
      redirect_to user_addresses_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    if @address.destroy      
      redirect_to user_addresses_path(params[:user_id])
    else
      render plain: 'Address is not deleted or not present previoulsy'
    end
  end

  private
  def address_params
    params.require(:address).permit(:house_number, :area, :city)
  end

  def get_address
    @address = Address.find_by(id: params[:id])
  end

  def get_address
    @address = Address.find_by(id: params[:id])
  end
end
