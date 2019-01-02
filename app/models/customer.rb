# == Schema Information
#
# Table name: customers
#
#  id                 :bigint(8)        not null, primary key
#  fullname           :string(255)
#  email              :string(255)
#  phone              :string(255)
#  addres             :string(255)
#  ip                 :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  published          :boolean          default(FALSE)
#

class Customer < ApplicationRecord
  has_many :messages

  has_attached_file :photo,
    styles: {
      thumb:  '200x200#',
      medium: '400x200#'},
    default_url: "clients/ClientLogo01.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def self.find_or_create(options={})
    email = options[:email]
    find_or_create_by(email: email) do |customer|
      customer.fullname = options[:fullname] || email.match(/$(.*)@/)[1]
    end
  end
end
