class DistanceController < ApplicationController
    def distance_to_india
        origin = params[:origin]
        distance = Distance.find_by(country: origin)
        unless distance.nil?
            render json: {distance: distance.distance}, status: :ok
        else
            render json: {error: "Distance not found"}, status: :not_found
        end            
    end
end