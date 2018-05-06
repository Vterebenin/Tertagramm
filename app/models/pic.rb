class Pic < ApplicationRecord
	acts_as_votable 
	belongs_to :user
	has_attached_file :image, styles: { :medium => "300x300>" }, default_url: "/images/:style/missing.png", s3_region: ENV["AWS_REGION"]
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
