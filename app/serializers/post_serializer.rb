class PostSerializer
  include JSONAPI::Serializer
  attributes :name, :body, :image_url

  attribute :image_url do |object|
    Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true) if object.image.attached?
  end
end
