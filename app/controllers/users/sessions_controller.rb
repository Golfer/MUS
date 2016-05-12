class Users::SessionsController <  Devise::SessionsController
  def create
    super
    authorization_user = Authorization.from_devise(params[:user])
    session[:user_id] = authorization_user.id
  end

end
