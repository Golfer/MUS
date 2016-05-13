class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    p '-------Facebook-----'
    p params
    p request.env["omniauth.auth"]
    p '-------Facebook-----'
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end


end
