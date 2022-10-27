class CommentsController < ApplicationController
  before_action :set_tweet
  before_action :authenticate_user!
  def create
    @comment = @tweet.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
  def set_tweet
    @tweet = Tweet.find(params[:post_id])
  end
end
