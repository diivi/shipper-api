class PublicController < ApplicationController
    before_action :authenticate_api_key!

    def authenticate_api_key!
        api_key = request.headers['Authorization'].split(' ').last
    end
end