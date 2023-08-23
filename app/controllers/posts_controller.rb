class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.new(post_params)
    render json: {
      body: @post.body,
      created_at: l(@post.created_at)
    } if @post.save
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    render json: { delete: @post.id }
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
