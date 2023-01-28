class BusinessController < ApplicationController
    before_action :authenticate_business!
    before_action :get_business_from_token, only: %i[ items ]

    def items
        @items = @business.items
        render json: @items, include: :warehouse
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
