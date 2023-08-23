class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.order(name: :asc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end
end
