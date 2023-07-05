class Api::V1::AuthController < Api::V1::ApplicationController
  def login
    if auth_params[:username] == 'John Doe' && auth_params[:password] == '456123'
      render json: { msg: 'Successful login' }, status: :ok
    else
      render json: { msg: 'Username or Password incorrect'}
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:username, :password)
  end
end
