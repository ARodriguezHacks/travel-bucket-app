module UsersHelper
    def activity_feed
        current_user.comments.order(created_at: :asc).limit(3)
    end
end
