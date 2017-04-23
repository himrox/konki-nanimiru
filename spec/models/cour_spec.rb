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

require 'rails_helper'

RSpec.describe Cour, type: :model do
  before do
    @cour = build(:cour)
  end

  context '有効な場合' do
    it 'year, seasonがある' do
      expect(@cour).to be_valid
    end

    it 'yearが2000以上' do
      @cour.year = 2000
      expect(@cour).to be_valid
    end

    it 'yearが2030以下' do
      @cour.year = 2030
      expect(@cour).to be_valid
    end

    it 'seasonが1〜4' do
      (1..4).each do |i|
        @cour.season = i
        expect(@cour).to be_valid
      end
    end
  end

  context '無効な場合' do
    it 'yearがない' do
      @cour.year = nil
      expect(@cour).not_to be_valid
    end

    it 'seasonがない' do
      @cour.season = nil
      expect(@cour).not_to be_valid
    end

    it 'yearが1999以下' do
      @cour.year = 1999
      expect(@cour).not_to be_valid
    end

    it 'yearが2031以上' do
      @cour.year = 2031
      expect(@cour).not_to be_valid
    end

    it 'seasonが5以上' do
      @cour.season = 5
      expect(@cour).not_to be_valid
    end

    it 'yearとseasonの組み合わせが一意でない' do
      dup_cour = @cour.dup
      @cour.save
      expect(dup_cour).not_to be_valid
    end
  end
end
