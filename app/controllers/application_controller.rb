class ApplicationController < ActionController::API
  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    begin
      payload = JWT.decode(token, Rails.application.credentials.fetch(:secret_key_base), true, algorithm: 'HS256')
      @current_user_id = payload[0]['sub']
    rescue JWT::DecodeError
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= User.find(@current_user_id)
  end
end
