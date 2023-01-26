class CommentsController < ApplicationController

  before_action :set_post

  def new
    @comment = Comment.find_by(id: params[:id])
  end

  def create
    @comment = @post.comments.new(messages:  params[:messages],
                                  user:      params[:by],
                                  parent_id: params[:parent_id],
                                  story_id:  params[:id])
    if @comment.save
      redirect_to home_page_path(@post)
      flash.now[:warning] = "Comment created"
    else
      flash.now[:error] = "Comment not created"
    end
  end

  private

  def set_post
    @post = Story.find_by(id: params[:id] || params[:format])
    return if @post.present?
    flash[:error] = "Post not found"
  end
end
