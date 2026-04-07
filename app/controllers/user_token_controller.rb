class UserTokenController < ApplicationController
  def create
    user = User.find_by(email: auth_params[:email])
    if user&.authenticate(auth_params[:password])
      token = JWT.encode(
        { sub: user.id, email: user.email, exp: (Time.now + 10000.days).to_i },
        Rails.application.credentials.fetch(:secret_key_base),
        'HS256'
      )
      render json: { jwt: token }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
