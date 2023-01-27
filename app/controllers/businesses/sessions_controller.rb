class Businesses::SessionsController < Devise::SessionsController
    respond_to :json
    private
    def respond_with(resource, _opts = {})
        render json: {
            message: 'Logged in succesfully',
            business: current_business
        }, status: :ok
    end

    def respond_to_on_destroy
        log_out_success && return if current_business

        log_out_failure
    end

    def log_out_success
        render json: { message: 'Logged out succesfully' }, status: :ok
    end

    def log_out_failure
        render json: { message: 'Log out failed' }, status: :unprocessable_entity
    end
end