class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def oauth2
    @user = Authorization.from_omniauth(oauth_params)
    sign_in_and_redirect @user
  end

  alias_method :facebook, :oauth2

  private

  def oauth_params
    request.env['omniauth.auth']
  end

end
