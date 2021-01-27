class Challenge < ApplicationRecord
  belongs_to :user
  has_many :tagged_challenges

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }

  def self.create_challenge_with_tags(challenge_params, user)
    transaction do
      challenge = new(challenge_params.except(:tags))
      challenge.user = user
      return challenge unless challenge.save

      raw_tags = challenge_params[:tags].split(', ')
      tags = raw_tags.map { |tag| Tag.find_or_create_by(name: tag) }
      TaggedChallenge.add_tags_to_challenge(challenge, tags)
      challenge
    end
  end
end
