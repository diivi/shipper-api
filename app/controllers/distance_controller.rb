class DistanceController < ApplicationController
    def distance_to_india
        origin = params[:origin]
        distance = Distance.find_by(country: origin)
        render json: { distance: distance.distance }
    end
end