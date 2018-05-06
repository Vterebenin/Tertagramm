class Pic < ApplicationRecord
	acts_as_votable 
	belongs_to :user
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_attached_file :image,
                :storage => :amazon,
                :s3_credentials => "#{Rails.root}/config/storage.yml",
                default_url: "/images/:style/missing.png",
                s3_region: ENV["AWS_REGION"]
end
