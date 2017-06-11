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

class Watch < ApplicationRecord
  belongs_to :anime
  belongs_to :user
end
