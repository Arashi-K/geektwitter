class LikesController < ApplicationController
  def index(tweet_id)
    @like = Tweet.find(tweet_id).likes.includes(:user)
  end

  def create(tweet_id)
    like = Like.create(user: current_user, tweet: Tweet.find(tweet_id))
    redirect_to tweet_path(tweet_id)
  end

  def destroy(tweet_id, id)
    Like.find(id).destroy
    redirect_to tweet_path(tweet_id)
  end
end
