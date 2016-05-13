class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, :presence => true

  def self.find_or_create(auth_hash)
    unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      user = User.create :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]
      auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end

    auth
  end

  # class << self
  #   def from_devise(user_info)
  #     curr_user = User.find_by_email(user_info[:email]) if user_info[:email]
  #     authorization_user = authorize_devise(curr_user)
  #     authorization_user.user
  #   end
  #
  #   def authorize_devise(auth_user)
  #     first_or_create(
  #         provider: 'devise',
  #         uid: SecureRandom.uuid,
  #         user_id: auth_user.id,
  #         username: auth_user.full_name,
  #         token: Devise.friendly_token[0, 20]
  #     )
  #   end
  #
  #   def authorize_oauth2(auth_user, current_user )
  #     first_or_create(
  #         provider: auth_user.provider,
  #         uid: auth_user.uid,
  #         user_id: current_user.id,
  #         username: auth_user.info.name,
  #         token: auth_user.token
  #     )
  #   end
  # end
end
