# == Schema Information
#
# Table name: messages
#
#  id          :bigint(8)        not null, primary key
#  customer_id :bigint(8)
#  message     :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :customer
end
