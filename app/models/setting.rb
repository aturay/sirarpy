# == Schema Information
#
# Table name: settings
#
#  id                :bigint(8)        not null, primary key
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Setting < ApplicationRecord
  has_attached_file :logo,
    styles: {
      medium: "240x80#{}",
      thumb: "100x100>"},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  scope :logo, ->{last.logo.url(:medium)}
end
