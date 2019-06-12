class AddressesController < ApplicationController
  before_action :check_authorization_user

  def index
    @user = User.find_by(id: params[:user_id])
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @address = Address.new
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @address = Address.find_by(id: params[:id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
    address = @user.addresses.create(address_params)
    redirect_to user_addresses_path(@user)
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_addresses_path(params[:user_id])
    else
      render 'edit'
    end
  end

  def destroy
    Address.find_by(id: params[:id]).destroy
    redirect_to user_addresses_path(params[:user_id])
  end

  private
  def address_params
    params.require(:address).permit(:house_num, :area, :city)
  end
end
