# == Schema Information
#
# Table name: animes
#
#  id         :integer          not null, primary key
#  title      :string
#  public_url :string
#  cour_id    :integer
#  api_number :integer
#  story      :text
#  img_url    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Anime < ApplicationRecord
  VALID_URL_REGEX = /\Ahttps?:\/\//i

  validates :title, presence: true, length: { maximum: 200 },
                    uniqueness: { scope: [:cour_id] }
  validates :public_url, allow_blank: true, format: { with: VALID_URL_REGEX },
                         length: { maximum: 2000 }
  validates :api_number, presence: true
  validates :story, allow_blank: true, length: { maximum: 1000 }
  validates :img_url, allow_blank: true, format: { with: VALID_URL_REGEX },
                      length: { maximum: 2000 }

  belongs_to :cour
end
