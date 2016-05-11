class Authorization < ActiveRecord::Base
  belongs_to :user

  class << self
    def from_omniauth(omniauth, singin_user = nil)
      user = User.omniauth_user(omniauth.info)
      authorization_user ||= authorization_user(omniauth, user)
      logger.info '------from_omniauth--------------------'
      logger.info user.inspect
      logger.info authorization_user.inspect
      logger.info '-----from_omniauth---------------------'

      # user = User.where(email: data.email)
      # user = User.create(full_name: data.name, email: data.email, encrypted_password: Devise.friendly_token[0,20]) unless user
      # authorization = Authorization.create(provider: omniauth_auth.provider, uid: omniauth_auth.uid, user: user, username: data.name, token: Devise.friendly_token[0,20], secret: 'testLocal_secret')
      # authorization.user
    end


    def authorization_user(auth_user, current_user)
      first_or_create(
          provider: auth_user.provider,
          uid: auth_user.uid,
          user_id: current_user.id,
          username: auth_user.info.name,
          token: auth_user.token
      )
    end

  end
end
