class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!

  def social_oauth2
    p '----------social_oauth2----------1'
    p params[:token]
    p params
    p request.env['omniauth.auth']
    p '--------------social_oauth2------1'
    user = Authorization.from_omniauth(request.env['omniauth.auth'], current_user)
    session[:user_id] = user.id
    if user
      redirect_to root_path
    else
      session['devise.user_attributes'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def auth_fail
    render text: "You've tried to authenticate via #{params[:strategy]}, but the following error occurred: #{params[:message]}", status: 500
  end


  alias_method :facebook,      :social_oauth2
  alias_method :google_oauth2, :social_oauth2

  private

  def omniauth
    request.env['omniauth.auth']
  end
end
