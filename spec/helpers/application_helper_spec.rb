require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#current_cour' do
    it '現在の日付を表すクールを返すこと' do
      cour = create(:cour)
      expect(helper.current_cour).to eq cour
    end
  end

  describe '#season(mon)' do
    it '引数で与えた月の季節を表す数値を返すこと' do
      (1..3).each do |winter|
        expect(helper.season(winter)).to eq 1
      end

      (4..6).each do |spring|
        expect(helper.season(spring)).to eq 2
      end

      (7..9).each do |summer|
        expect(helper.season(summer)).to eq 3
      end

      (10..12).each do |autumn|
        expect(helper.season(autumn)).to eq 4
      end
    end
  end
end
