class HomePageController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_post, only: [:show, :new, :update]

  def index
    @posts = Story.all.order(created_at: :desc)
  end

  def show
  end

  def new
  end

  def update
    @post.update(likes: @post.likes + 1, time: Date.today)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "#{dom_id(@post)}_likes",
          partial: 'home_page/likes',
          locals:  { post: @post }
        )
      end
    end
  end

  private

  def set_post
    @post = Story.find_by(id: params[:id])
    return if @post.present?
    flash[:error] = "Post not found"
  end
end
