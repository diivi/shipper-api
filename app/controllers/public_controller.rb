class PublicController < ApplicationController
    before_action :authenticate_api_key!

    def items
        items = @public_api_key.business.items
        render json: items, include: :warehouse
    end

    def warehouses
        warehouses = @public_api_key.business.warehouses
        render json: warehouses
    end

    def warehouse
        warehouse = @public_api_key.business.warehouses.find(params[:id])
        render json: warehouse
    end

    


    def authenticate_api_key!
        api_key = request.headers['Authorization'].split(' ').last
        @public_api_key = PublicApiKey.find_by(key: api_key)
        if @public_api_key.nil?
            render json: { error: 'Invalid API key' }, status: :unauthorized
        end
    end
end