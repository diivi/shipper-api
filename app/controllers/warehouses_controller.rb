class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[ show update destroy ]
  before_action :authenticate_business!, only: %i[ create update destroy ]
  before_action :get_business_from_token, only: %i[ index create ]

  # GET /warehouses
  def index
    @warehouses = @business.warehouses
    render json: @warehouses
  end

  # GET /warehouses/1
  def show
    render json: @warehouse
  end

  # POST /warehouses
  def create
    @warehouse = @business.warehouses.build(warehouse_params)

    if @warehouse.save
      render json: @warehouse, status: :created, location: @warehouse
    else
      render json: @warehouse.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /warehouses/1
  def update
    if @warehouse.update(warehouse_params)
      render json: @warehouse
    else
      render json: @warehouse.errors, status: :unprocessable_entity
    end
  end

  # DELETE /warehouses/1
  def destroy
    @warehouse.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warehouse_params
      params.require(:warehouse).permit(:name, :max_items, :location)
    end

    private 

    def get_business_from_token
      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key])
      business_id = decoded_token[0]['sub']
      @business = Business.find(business_id)
    end
end
