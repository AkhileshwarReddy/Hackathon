class TaggedChallenge < ApplicationRecord
  belongs_to :tag
  belongs_to :challenge
end
