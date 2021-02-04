class TaggedChallenge < ApplicationRecord
  belongs_to :tag
  belongs_to :challenge

  scope :tags, ->(id) { where(challenge_id: id).map(&:tag) }
end
