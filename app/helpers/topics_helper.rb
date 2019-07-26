module TopicsHelper
  def user_is_authorized_for_topics?
    current_user && current_user.admin?
  end

  def order_topics
    Topic.order(created_at: :desc).limit(3)
  end
end
