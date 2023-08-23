class PagesController < ApplicationController
  def home
    @posts = current_user.following_posts if current_user.present?
  end
end
