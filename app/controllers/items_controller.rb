class ItemsController < ApplicationController
  before_action :get_warehouse
  before_action :authenticate_business!
  before_action :get_business_from_token
  before_action :authorize_business
  before_action :check_limit_exceeded, only: %i[ create ]

  def index
    @items = @warehouse.items
    render json: @items
  end

  def show
    @item = @warehouse.items.find(params[:id])
    render json: @item
  end

  def create
    @item = @warehouse.items.build(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    @item = @warehouse.items.find(params[:id])
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item = @warehouse.items.find(params[:id])
    @item.destroy
  end

  private 

  def item_params
    params.require(:item).permit(:name, :quantity, :category_id)
  end

  def get_warehouse
    @warehouse = Warehouse.find(params[:warehouse_id])
  end

  def get_business_from_token
    token = request.headers['Authorization'].split(' ').last
    decoded_token = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key])
    business_id = decoded_token[0]['sub']
    @business = Business.find(business_id)
  end

  def authorize_business
    if @business != @warehouse.business
      render json: { error: "You are not authorized to perform this action" }, status: :unauthorized
    end
  end

  def check_limit_exceeded
    if @warehouse.items.length + item_params[:quantity].to_i > @warehouse.max_items
      render json: { error: "Warehouse capacity exceeded" }, status: :unprocessable_entity
    end
  end
end
