class Idea < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  validates :name, presence: true

  def recent?
    created_at >= 2.days.ago
  end
end
