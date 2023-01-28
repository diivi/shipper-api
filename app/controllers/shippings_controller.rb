class ShippingsController < ApplicationController
  before_action :authenticate_business!
  before_action :set_shipping, only: %i[ show update destroy ]
  before_action :get_business_from_token, only: %i[ index create ]
  before_action :authorize_business, only: %i[ show update destroy ]

  def index
    @shippings = @business.shippings
    render json: @shippings
  end

  def show
    render json: @shipping
  end

  def create
    @shipping = @business.shippings.build(shipping_params)
    if @shipping.save
      render json: @shipping, status: :created, location: @shipping
    else
      render json: @shipping.errors, status: :unprocessable_entity
    end
  end

  def update
    if @shipping.update(shipping_params)
      render json: @shipping
    else
      render json: @shipping.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @shipping.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping
      @shipping = Shipping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipping_params
      params.require(:shipping).permit(:predicted_price, :source, :destination, :shipping_type, :status, :location, :item_id)
    end

    def authorize_business
      if current_business.id != @shipping.item.warehouse.business_id
        render json: { error: 'You are not authorized to perform this action' }, status: :unauthorized
      end
    end

    def get_business_from_token
      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key])
      business_id = decoded_token[0]['sub']
      @business = Business.find(business_id)
    end
end
