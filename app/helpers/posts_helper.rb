module PostsHelper
  def destroy_post_link(post)
    link_to t('delete'),
            post_path(post),
            data: {
              turbo_method: :delete,
              turbo_confirm: t('confirm_question')
            }
  end
end
