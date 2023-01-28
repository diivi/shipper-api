class AdminController < ApplicationController
  before_action :authenticate_admin!

  def shipping_requests
    @shippings = Shipping.where(status: 'pending')
    render json: @shippings, :include => {:business => {:only => :email}}
  end

  def shippings
    @shippings = Shipping.where(status: 'accepted')
    render json: @shippings, :include => {:business => {:only => :email}}
  end

  def update_shipping_status
    @shipping = Shipping.find(params[:id])      
    @shipping.update(shipping_update_params)
    if params[:status] == "accepted"
      @shipping.item.warehouse.update(quantity: @shipping.item.warehouse.quantity - @shipping.quantity)
    end
    if params[:status] == "delivered" and @shipping.type == "to_warehouse"
      @shipping.to_warehouse.update(quantity: @shipping.quantity + @shipping.to_warehouse.quantity)
    end
    render json: @shipping
  end

  def update_shipping_location
    @shipping = Shipping.find(params[:id])
    @shipping.update(location: params[:location])
    render json: @shipping
  end

  def shipping_update_params
    params.permit(:status, :price)
  end
end