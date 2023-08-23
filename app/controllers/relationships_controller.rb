class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def followers
    @users = @user.followers
  end

  def followees
    @users = @user.followees
  end

  def toggle_follow
    if current_user.is_following?(@user)
      @followee_relationship = current_user.followee_relationships.find_by!(followee: @user)
      @followee_relationship.destroy
      render json: { unfollow: @user.id }
    else
      @followee_relationship = current_user.followee_relationships.new(followee: @user)
      @followee_relationship.save ? (render json: { follow: @user.id }) : (head :not_acceptable)
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
