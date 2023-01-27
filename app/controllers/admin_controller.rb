class AdminController < ApplicationController
  before_action :authenticate_admin!

  def shipping_requests
    @shippings = Shipping.where(status: 'pending')
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
    render json: @shipping
  end

  def update_shipping_location
    @shipping = Shipping.find(params[:id])
    @shipping.update(location: params[:location])
    render json: @shipping
  end


end