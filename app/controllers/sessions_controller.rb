class SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      @current_user = user
      render json: { user: user, token: user.generate_jwt, message: 'User logged in!'}, status: 200
    else
      render json: { errors: ['Invalid Credentials'] }, status: 404
    end
  end

  def destroy
    render json: { status: 200, message: 'Signed out' }
  end
end
