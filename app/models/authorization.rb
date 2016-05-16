class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, :presence => true


  class << self
    def from_omniauth(auth)
      unless authorization = find_by_provider_and_uid(auth.provider, auth.uid)
        user = User.from_omniauth(auth)
        authorization = create user: user, provider: auth.provider, uid: auth.uid, username: auth_user.full_name, token: auth.credentials.token
      end

      authorization.user
    end

    def from_devise(user_params)
      user = User.find_by_email(user_params[:email]) if user_params[:email]
      authorize_devise(user)
      user
    end

    def authorize_devise(auth_user)
      authorize = unless  find_by_user_id(auth_user.id)
                    create(
                        provider: 'devise',
                        uid: SecureRandom.uuid,
                        user_id: auth_user.id,
                        username: auth_user.full_name,
                        token: Devise.secret_key[0, 20]
                    )
                  end

      authorize
    end
  end
end
