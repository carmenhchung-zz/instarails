class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = @photo.comments
    @comment = Comment.new
    # the .all method is inherited from ActiveRecord
  end

  def create
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user #devise method
    if @comment.save
        flash[:success] = 'Comment added!'
        redirect_to root_path
    end
  end
  private

  def comment_params
  params.require(:comment).permit(:content)
  end

  def set_post
  @photo = Photo.find(params[:photo_id])
  end
end
