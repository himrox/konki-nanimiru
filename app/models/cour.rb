# == Schema Information
#
# Table name: cours
#
#  id         :integer          not null, primary key
#  year       :integer
#  season     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cour < ApplicationRecord
  has_many :animes, dependent: :destroy

  validates :year, presence: true,
                   numericality: { only_integer: true,
                                   greater_than_or_equal_to: 2000,
                                   less_than_or_equal_to: 2030 },
                   uniqueness: { scope: [:season] }
  validates :season, presence: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 4 }
end
