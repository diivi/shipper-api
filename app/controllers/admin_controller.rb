class AdminController < ApplicationController
  before_action :authenticate_admin!

  def shipping_requests
    @shippings = Shipping.where(status: 'pending').include(:business)
    render json: @shippings
  end

  def shippings
    @shippings = Shipping.where(status: 'accepted')
    render json: @shippings
  end

  def update_shipping_price
    @shipping = Shipping.find(params[:id])
    @shipping.update(price: params[:predicted_price])
    render json: @shipping
  end

  def update_shipping_status
    @shipping = Shipping.find(params[:id])      
    @shipping.update(status: params[:status])
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
end