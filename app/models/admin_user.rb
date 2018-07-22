# == Schema Information
#
# Table name: admin_users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer          default("master"), not null
#  firstname              :string(255)
#  lastname               :string(255)
#  phone                  :string(255)
#  addres                 :text(65535)
#  social_url             :string(255)
#  picture_file_name      :string(255)
#  picture_content_type   :string(255)
#  picture_file_size      :integer
#  picture_updated_at     :datetime
#  staff                  :boolean          default(FALSE)
#

class AdminUser < ApplicationRecord
  role_based_authorizable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable #,:confirmable, :lockable

  has_many :productis

  has_attached_file :picture,
    styles: {
      medium: "640x640>",
      public: "400x400>",
      avatar: "200x245>",
      thumb: "100x100>"},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  scope :collection, -> {all.map {|m| [m.full_name, m.id]}}
  scope :staffs, -> { where staff: true }

  def full_name
    "#{self.firstname} #{self.lastname}"
  end
end
