class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: PostSerializer.new(@post).serializable_hash[:data][:attributes], status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:name, :body, :image)
  end

end
