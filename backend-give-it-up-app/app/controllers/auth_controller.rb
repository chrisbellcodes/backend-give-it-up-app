class AuthController < ApplicationController

  def create

    user = User.find_by(first_name: params[:first_name])
    is_authenticated = user.authenticate(params[:password])

    if is_authenticated
      payload = { user_id: user.id }
      token = JWT.encode(payload, 'loveArtsEd', 'HS256')
      
      render json: { token: token }
    else
      render json: { errors: ["Wrong password"]}, status: 422
    end

  end

  private



end
