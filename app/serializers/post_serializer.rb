class PostSerializer
  include JSONAPI::Serializer
  attributes :name, :body, :videos_url

end
