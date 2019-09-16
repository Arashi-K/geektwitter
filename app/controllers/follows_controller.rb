class FollowsController < ApplicationController
  def follow_index(user_id)
    @user = User.find(user_id)
    @follows = @user.from_user_follows
  end

  def followed_index(user_id)
    @user = User.find(user_id)
    @follows = @user.to_user_follows
  end

  def create(user_id)
    @follow = Follow.create(from_user: current_user, to_user: User.find(user_id))
    redirect_to user_path(user_id)
  end

  def destroy(user_id, id)
    Follow.find(id).destroy
    redirect_to user_path(user_id)
  end
end
