class OmniauthCallbacksController <  Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!
  def oauth2
    user = Authorization.from_omniauth(request.env['omniauth.auth'], current_user)
    if user
      redirect_to root_path
    else
      session['devise.user_attributes'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :oauth2
  alias_method :google_oauth2, :oauth2
end
