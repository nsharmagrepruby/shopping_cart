class AddressesController < ApplicationController
  before_action :check_authorization_user
  before_action :get_address, only: [:edit, :update, :destroy]
  
  def index; end

  def new
    @address = Address.new
  end

  def edit
    @address = Address.find_by(id: params[:id])
  end

  def create
    @address = current_user.addresses.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      render 'new'
    end
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render 'edit'
    end
  end

  def destroy
    if @address.destroy && @address.destroyed?
      redirect_to addresses_path
    else
      render plain: 'Address is not deleted'
    end
  end

  private
  def address_params
    params.require(:address).permit(:house_number, :area, :city)
  end

  def get_address
    @address = Address.find_by(id: params[:id])
  end
end
