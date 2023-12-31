module NavHelper
  def sign_up_link
    link_to t('sign_up'),
            new_user_registration_path
  end

  def sign_in_link
    link_to t('sign_in'),
            new_user_session_path
  end

  def sign_out_link
    link_to t('sign_out'),
            destroy_user_session_path,
            data: {
              turbo_method: :delete,
              turbo_confirm: t('confirm_question')
            }
  end

  def edit_user_link
    link_to t('edit_user'),
            edit_user_registration_path
  end

  def home_link
    link_to t('home'),
            root_path
  end

  def my_profile_link
    link_to t('my_profile'),
            user_path(current_user)
  end

  def all_users_link
    link_to t('all_users'),
            users_path
  end
end