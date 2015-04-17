class Image < ActiveRecord::Base
#  attr_accessible :name, :size, :thumbnail_url, :url
  attr_accessible :image
  has_attached_file :image

  belongs_to :book

  include Rails.application.routes.url_helpers

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
        "name" => read_attribute(:image_file_name),
        "size" => read_attribute(:image_file_size),
        "url" => image.url(:original),
        "delete_url" => image_path(self),
#        "thumbnail_url" => image.thumbnail_url,
        "delete_type" => "DELETE"
    }
  end

end
