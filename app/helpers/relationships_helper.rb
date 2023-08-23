module RelationshipsHelper
  def followers_link(user)
    link_to t('followers'),
            followers_user_relationships_path(user)
  end

  def followees_link(user)
    link_to t('followees'),
            followees_user_relationships_path(user)
  end

  def toogle_follow_link(user)
    link_to current_user.is_following?(user) ? t('unfollow') : t('follow'),
            toggle_follow_relationship_path(user),
            data: { 'turbo-method': :post }
  end
end
