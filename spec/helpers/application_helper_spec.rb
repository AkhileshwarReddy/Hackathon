require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:challenges) { create_list(:challenge, rand(0..10)) }

  describe '#page_entries_info' do
    it 'should return as no challenges if no items in collection' do
      expect(page_entries_info(Challenge.all.paginate(page: 2, per_page: 10))).to eq('No items found')
    end

    it 'should return as displaying all if items in collection are less then per_page size' do
      expect(page_entries_info(Challenge.all.paginate(page: 1, per_page: challenges.count))).to(
        eq('Displaying all Challenges')
      )
    end

    it 'should return with offsets ant total' do
      challenges = create_list(:challenge, 10)
      expect(page_entries_info(Challenge.all.paginate(page: 1, per_page: 5))).to(
        eq('Displaying 1 - 5 of 10 Challenges')
      )
    end
  end
end