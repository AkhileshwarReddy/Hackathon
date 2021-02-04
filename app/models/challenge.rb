class Challenge < ApplicationRecord
  self.per_page = 10
  belongs_to :user
  has_many :tagged_challenges, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :collaborations, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { in: 10..10_000 }

  default_scope -> { order(created_at: :desc) }
  scope :collaborators, ->(id) { Collaboration.where(challenge_id: id).map(&:user) }
end
