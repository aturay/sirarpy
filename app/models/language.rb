# == Schema Information
#
# Table name: languages
#
#  id         :bigint(8)        not null, primary key
#  language   :integer
#  position   :integer          default(1)
#  published  :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Language < ApplicationRecord
  has_many :sliders
  enum language: [:en, :de, :ru, :am]

  def self.default
    self.find_by_language 'en'
  end
end
