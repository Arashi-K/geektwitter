class CommentsController < ApplicationController

  permits :content

  def create(tweet_id, comment)
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.tweet = Tweet.find(tweet_id)
    @comment.save
    redirect_to tweet_path(tweet_id)
  end

  def destroy(tweet_id, id)
    Comment.find(id).destroy
    redirect_to tweet_path(tweet_id)
  end
end
