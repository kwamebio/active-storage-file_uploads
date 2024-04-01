class Post < ApplicationRecord
  has_many_attached :videos

  validates :name, presence: true


  def videos_url
      self.videos.map { |video| Rails.application.routes.url_helpers.rails_blob_url(video) } if self.videos.attached?
  end
end
