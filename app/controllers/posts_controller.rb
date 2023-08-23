class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      turbo_stream_response_create(@post)
    else
      head :not_acceptable
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    turbo_stream_response_destroy(@post)
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def turbo_stream_response_create(post)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.prepend('posts_table', partial: 'posts/post', locals: { post: post }),
          turbo_stream.replace('post_form', partial: 'posts/new'),
          turbo_stream.update('success_notice', t('post_successfully_created'))
        ]
      end
    end
  end

  def turbo_stream_response_destroy(post)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(post)
      end
    end
  end
end
