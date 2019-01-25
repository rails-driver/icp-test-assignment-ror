class ApplicationController < ActionController::API
  include Auth
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found(exception)
    render json: {
      error: exception.message
    }, status: 404
  end
end
