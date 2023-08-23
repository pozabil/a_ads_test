class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[followers followees]

  def followers
    @users = @user.followers.order(name: :asc)
  end

  def followees
    @users = @user.followees.order(name: :asc)
  end

  def toggle_follow
    return head :not_acceptable if current_user.id == params[:id].to_i

    @user = User.find(params[:id])
    if current_user.is_following?(@user)
      unfollow_with_response(@user)
    else
      follow_with_response(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def follow_with_response(user)
    followee_relationship = current_user.followee_relationships.new(followee: user)
    followee_relationship.save
    turbo_stream_response_toggle_follow(@user, t('unfollow'))
  end

  def unfollow_with_response(user)
    followee_relationship = current_user.followee_relationships.find_by!(followee: user)
    followee_relationship.destroy
    turbo_stream_response_toggle_follow(@user, t('follow'))
  end

  def turbo_stream_response_toggle_follow(user, link_text)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("toggle_follow_link_#{user.id}", link_text)
        ]
      end
    end
  end
end
