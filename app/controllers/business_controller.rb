class BusinessController < ApplicationController
    before_action :authenticate_business!
    before_action :get_business_from_token

    def items
        @items = @business.items
        render json: @items, include: :warehouse
    end

    def generate_api_key
        @public_api_key = @business.public_api_keys.build(key: SecureRandom.hex)
        if @public_api_key.save
            render json: @public_api_key
        else
            render json: @public_api_key.errors, status: :unprocessable_entity
        end
    end

    def get_api_keys
        @public_api_keys = @business.public_api_keys
        render json: @public_api_keys
    end

    private

    def get_business_from_token
        begin
            token = request.headers['Authorization'].split(' ').last
            decoded_token = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key])
            business_id = decoded_token[0]['sub']
            @business = Business.find(business_id)
        rescue JWT::DecodeError
            render json: { error: 'Invalid token' }, status: :unauthorized
        end
    end
end
