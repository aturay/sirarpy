# == Schema Information
#
# Table name: products
#
#  id            :bigint(8)        not null, primary key
#  title         :string(255)
#  description   :text(65535)
#  owerview      :text(65535)
#  price         :integer
#  type_id       :bigint(8)
#  admin_user_id :bigint(8)
#  language_id   :bigint(8)
#  published     :boolean          default(TRUE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Product < ApplicationRecord
  has_many :product_images, dependent: :delete_all
  belongs_to :language
  belongs_to :type
  belongs_to :admin_user

  def public_image_url
    product_images.last.image.url(:medium) rescue '/assets/missing_product.png'
  end

  def public_image_icon
    product_images.last.image.url(:midle) rescue '/assets/missing_product.png'
  end

  def master_name
    admin_user.full_name
  end

  def master_social_url
    admin_user.social_url
  end

  def uploads=(files)
    files.each_with_index do |file, i|
      ProductImage.create([{
        image:    file,
        product:  self,
        position: i + 1
      }])
    end
  end
end
