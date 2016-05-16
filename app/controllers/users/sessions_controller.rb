class Users::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    user = Authorization.from_devise(user_params)
    session[:current_user] = user.id
    super
  end

  private

  def user_params
    accessible = [ :name, :email ]
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
