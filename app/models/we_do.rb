# == Schema Information
#
# Table name: we_dos
#
#  id                :bigint(8)        not null, primary key
#  title             :string(255)
#  description       :text(65535)
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer
#  icon_updated_at   :datetime
#  position          :integer
#  published         :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class WeDo < ApplicationRecord
  belongs_to :language

  has_attached_file :icon,
    styles: {
      medium: "360x360>",
      thumb: "100x100>"},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/
end
