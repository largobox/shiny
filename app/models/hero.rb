class Hero < ActiveRecord::Base

  has_and_belongs_to_many :articles

	has_attached_file :hero_pic, styles: { normal: '128x72>' }, default_url: 'dota_default.jpg'
  validates_attachment_content_type :hero_pic, content_type: /\Aimage\/.*\Z/
end
