# == Schema Information
#
# Table name: contacts
#
#  id          :bigint(8)        not null, primary key
#  email       :string(255)
#  phones      :string(255)
#  language_id :bigint(8)
#  address     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Contact < ApplicationRecord
  belongs_to :language
end
