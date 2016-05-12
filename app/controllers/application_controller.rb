class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :initialize_omniauth_state

  def initialize_omniauth_state
    session['omniauth.state'] = response.headers['X-CSRF-Token'] = form_authenticity_token
  end

end
