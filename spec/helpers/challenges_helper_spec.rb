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
    let(:tagged_challenge) { create(:tagged_challenge) }

    it 'should return challenge tags' do
      expect(challenge_tags(tagged_challenge.challenge).first).to eq(tagged_challenge.tag)
    end
  end
end
