module ApplicationHelper
  def whoami?(user, commodity)
    whoami = 'guest'
    if user_signed_in?
      if commodity.user == user
        whoami = "seller"
      else
        user.orders.each{ |order| return 'buyer' if commodity.orders.include?(order) }
      end
    end
    return whoami
  end

  def title(page_title, options={})
    content_for(:title, page_title.to_s)
    return content_tag(:h1, page_title, options)
  end
end
