class TweetsController < ApplicationController

  permits :body

  before_action do
    if !user_signed_in?
      redirect_to new_user_session_path()
    end
  end

  def index
    @tweets = Tweet.all.includes(:user)
  end

  def new
    @tweet=Tweet.new
  end

  def show(id)
    @tweet = Tweet.find(id)
    @comment = Comment.new
    @comments = @tweet.comments
    @like =Like.find_by(tweet: Tweet.find(id), user: current_user)
  end

  def edit(id)
    @tweet = Tweet.find(id)
  end

  def update(id, tweet)
    @tweet = Tweet.find(id)
    if @tweet.update(tweet)
      redirect_to tweet_path(id)
    else
      redirect_to edit_tweet_path(id)
    end
  end

  def create(tweet)
    @tweet = Tweet.new(tweet)
    @tweet.user = current_user
    if @tweet.save
      redirect_to tweets_path()
    else
      redirect_to new_tweet_path()
    end
  end

  def destroy(id)
    Tweet.find(id).destroy
    redirect_to tweets_path()
  end
end
