class PostsController < ApplicationController
  def create
    @post = Post.new(post_params.except(:videos))
    videos = Array.wrap(params[:videos])


    if videos
      videos.each do |video|
        @post.videos.attach(video)
      end
    end
    if @post.save
      render json: PostSerializer.new(@post).serializable_hash[:data][:attributes], status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:name, :body, videos: [])
  end

end
