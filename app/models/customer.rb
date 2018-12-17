# == Schema Information
#
# Table name: customers
#
#  id         :bigint(8)        not null, primary key
#  fullname   :string(255)
#  email      :string(255)
#  phone      :string(255)
#  addres     :string(255)
#  ip         :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
  has_many :messages

  def self.find_or_create(options={})
    email = options[:email]
    find_or_create_by(email: email) do |customer|
      customer.fullname = options[:name] || email.cut(/$(.*)@/)
    end
  end
end
