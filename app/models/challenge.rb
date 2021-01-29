class Challenge < ApplicationRecord
  belongs_to :user
  has_many :tagged_challenges, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :collaborations, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { in: 10..10_000 }

  scope :vote_count, ->(challenge) { Vote.where(challenge: challenge).count }
  scope :collaborators, ->(challenge) { Collaboration.where(challenge: challenge).map(&:user) }
end
