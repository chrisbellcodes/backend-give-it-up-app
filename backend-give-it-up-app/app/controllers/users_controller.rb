class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create(user_params)
    if user.valid?
      # Encoding user id to encrypt using JWT
      payload = { user_id: user.id }
      token = JWT.encode(payload, 'loveArtsEd', 'HS256')

      render json: { token: token }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def profile
    # decoding user id to get user
    token = request.headers["Authorization"]
    decoded_token = JWT.decode(token, 'loveArtsEd', true, { algorithm: 'HS256' })
    user_id = decoded_token[0]["user_id"]

    user = User.find(user_id)

    render json: user
  end

  private

  def user_params
    params.permit(:id, :first_name, :last_name, :email, :password)
  end
end
