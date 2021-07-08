class ProfileController < ApplicationController
  include Pagy::Backend
  def index
    @user = current_user
    @pagy, @posts = pagy(Post.where("user_id = ?", @user.id).order('updated_at DESC'))
  end
end
