# == Schema Information
#
# Table name: product_images
#
#  id                 :bigint(8)        not null, primary key
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  position           :integer          default(1)
#  published          :boolean          default(TRUE)
#  product_id         :bigint(8)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ProductImage < ApplicationRecord
  belongs_to :product

  has_attached_file :image,
    styles: {
      medium: "640x400#{}",
      midle: "370x231#{}",
      thumb: "100x100>"},
    default_url: "/images/:style/missing_product.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
