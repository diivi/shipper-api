class Businesses::RegistrationsController < Devise::RegistrationsController
    respond_to :json
    private 

    def respond_with(resource, _opts = {})
        register_success && return if resource.persisted?
        register_failed
    end

    def register_success
        render json: {
            message: 'Signed up succesfully',
            business: current_business
        }, status: :unprocessable_entity
    end

    def register_failed
        render json: {
            message: 'Registration failed',
        }, status: :unprocessable_entity
    end
end