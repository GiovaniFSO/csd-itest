class Api::V1::ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :no_method_error
  rescue_from NoMethodError, with: :no_method_error

  private

  def not_found
    head :not_found
  end

  def no_method_error(exception)
    render json: exception, status: :precondition_failed
  end
end
