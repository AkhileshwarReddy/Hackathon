class TaggedChallenge < ApplicationRecord
  belongs_to :tag
  belongs_to :challenge

  def self.add_tags_to_challenge(challenge, tags)
    transaction do
      tags.each { |tag| TaggedChallenge.create(challenge: challenge, tag: tag) }
    end
  end
end
