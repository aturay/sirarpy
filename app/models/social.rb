# == Schema Information
#
# Table name: socials
#
#  id         :bigint(8)        not null, primary key
#  title      :integer          default("icon-facebook-circled")
#  url        :string(255)
#  published  :boolean          default(TRUE)
#  position   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Social < ApplicationRecord
  enum title: {
    'icon-facebook-circled'  => 0,
    'icon-twitter-circled'   => 1,
    'icon-linkedin-circled'  => 2,
    'icon-pinterest-circled' => 3,
    'icon-dribbble-circled'  => 4,
    'icon-gplus-circled'     => 5,
    'icon-skype-circled'     => 6,
    'icon-tumblr-circled'    => 7,
    'icon-lastfm-circled'    => 8,
  }
end
