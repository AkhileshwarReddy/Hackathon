require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ChallengesHelper. For example:
#
# describe ChallengesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ChallengesHelper, type: :helper do
  describe '#challenge_tags' do
    let(:challenge) { create(:challenge) }
    let(:tags) { create_list(:tag, rand(1..5)) }
    let(:tagged_challenges) do
      tags.map { |tag| TaggedChallenge.create(challenge: challenge, tag: tag) }
    end

    it 'should return challenge tags' do
      # expect(challenge_tags(challenge)).to eq(tags)
    end
  end
end
