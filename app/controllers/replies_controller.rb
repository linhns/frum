class RepliesController < ApplicationController
  before_action :set_reply, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      flash[:success] = "Replied!"
    end
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
    if @reply.update(reply_params)
      flash[:success] = "Reply was successfully updated."
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    if @reply.destroy
      flash[:success] = "Reply destroyed"
    end
    redirect_to post_path(@post)
  end

  private
    def set_reply
      @post = Post.find(params[:post_id])
      @reply = @post.replies.find(params[:id])
    end

    def reply_params
      params.require(:reply).permit(:body)
    end
end
