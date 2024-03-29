# coding: utf-8
class User
  module OmniauthCallbacks

    ["facebook","google","twitter"].each do |provider|
      define_method "find_or_create_for_#{provider}" do |response|
        token = nil
        if provider == "facebook"
          token = response[:credentials][:token]
        end

        uid = response["uid"]
        data = response["info"]
        if user = User.includes(:authorizations).where("authorizations.provider" => provider , "authorizations.uid" => uid).first
          if token != nil and token != user.token
            user.token = token
            user.save
          end
          user
        elsif user = User.find_by_email(data["email"])
          user.bind_service(response)
          if token != nil and token != user.token
            user.token = token
            user.save
          end
          user
        else
          user = User.new_from_provider_data(provider,uid,data,token)

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


    def new_from_provider_data(provider, uid, data, token)
      user = User.new
      user.provider = provider
      user.token = token
      user.email = data["email"]
      user.profile = Profile.new
      user.profile.name = data["name"]
      user.profile.nickname = data["nickname"]

      if provider == "twitter"
        user.email = "twitter+#{uid}@twitter.com"
      elsif provider == "facebook"
        user.profile.mail = data["email"]
      end

      user.password = Devise.friendly_token[0,20]

      return user
    end
  end
end
