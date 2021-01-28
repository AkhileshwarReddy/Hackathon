class TaggedChallenge < ApplicationRecord
  belongs_to :tag
  belongs_to :challenge

  scope :tags, ->(challenge) { where(challenge: challenge).map(&:tag) }
end
