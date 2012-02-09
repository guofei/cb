module CommoditiesHelper
  def whoami?(user, commodity)
    whoami = 'guest'
    if user_signed_in?
      if commodity.user == current_user
        whoami = "seller"
      else
        current_user.orders.each{ |order| whoami = 'buyer' if commodity.orders.include?(order) }
      end
    end
    return whoami
  end
end
