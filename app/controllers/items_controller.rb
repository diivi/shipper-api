class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show update destroy ]
  before_action :authenticate_business!, only: %i[ create update destroy ]
  before_action :get_business_from_token, only: %i[ index create ]

  # GET /items
  def index
    @items = Item.all

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:quantity, :name, :warehouse_id, :category_id)
    end

    def get_business_from_token
      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key])
      business_id = decoded_token[0]['sub']
      @business = Business.find(business_id)
    end
end
