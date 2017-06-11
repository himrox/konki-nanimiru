# == Schema Information
#
# Table name: watches
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  anime_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :watch do
    user_id 1
    anime_id 1
  end
end
