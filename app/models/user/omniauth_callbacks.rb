# coding: utf-8
class User
  module OmniauthCallbacks

    ["facebook","google","twitter"].each do |provider|
      define_method "find_or_create_for_#{provider}" do |response|
        uid = response["uid"]
        data = response["info"]

        if user = User.where(:authorizations.provider => provider , :authorizations.uid => uid).first
          use.testtttt()
          user
        elsif user = User.find_by_email(data["email"])
          use.testtttt()
          user.bind_service(response)
          user
        else
          use.testtttt()
          user = User.new_from_provider_data(provider,uid,data)

          if user.save(:validate => false)
            user.authorizations << Authorization.new(:provider => provider, :uid => uid )
            return user
          else
            Rails.logger.warn("User.create_from_hash 失败，#{user.errors.inspect}")
            return nil
          end
        end

      end
    end


    def new_from_provider_data(provider, uid, data)
      user = User.new
      user.email = data["email"]
      user.email = "twitter+#{uid}@example.com" if provider == "twitter"

      user.password = Devise.friendly_token[0,20]

      return user
    end
  end
end
