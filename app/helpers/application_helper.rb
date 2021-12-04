module ApplicationHelper
  def subscription_message
    current_user.is_free ? 'Become paid User' : 'Cancel subscription'
  end
end
