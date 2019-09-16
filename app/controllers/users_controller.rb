class UsersController < ApplicationController
  def show(id)
    @user = User.find(id)
    @tweets = @user.tweets.includes(:user)
    @follow_users = @user.from_user_follows
    @followed_users = @user.to_user_follows
    if user_signed_in?
      @follow = Follow.find_by(from_user: current_user, to_user: @user)
      @room = Room.find_by(user1: current_user, user2: @user)

      @count = 0
      current_user.user2_rooms.each do |r|
        @count += r.messages.where(checked: false).count
      end
    end
  end

  def likes(id)
    @user = User.find(id)
    @like = @user.likes
  end
end
