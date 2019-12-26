module UsersHelper
    def activity_feed
        current_user.comments.order(created_at: :asc).limit(3)
    end

    def vote_feed
        current_user.votes.order(created_at: :asc).limit(3)
    end
end
