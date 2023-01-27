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

  def 

end