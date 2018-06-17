class Setting < ApplicationRecord
  has_attached_file :logo,
    styles: {
      medium: "240x80#{}",
      thumb: "100x100>"},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  scope :logo, ->{last.logo.url(:medium)}
end
