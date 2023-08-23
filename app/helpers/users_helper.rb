module UsersHelper
  def back_to_profile_link(user)
    link_to t('back_to_profile'),
            user_path(@user)
  end
end
