class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = current_user.posts.new(post_params)
    render json: {
      body: post.body,
      created_at: l(post.created_at)
    } if post.save
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
