# == Schema Information
#
# Table name: sliders
#
#  id                 :bigint(8)        not null, primary key
#  title              :string(255)
#  sub_title          :string(255)
#  description        :text(65535)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  position           :integer          default(1)
#  published          :boolean          default(TRUE)
#  language_id        :bigint(8)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Slider < ApplicationRecord
  belongs_to :language

  has_attached_file :image,
    styles: {
      medium: "320x320>",
      thumb: "100x100>"},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
