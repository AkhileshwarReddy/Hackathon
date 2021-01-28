class Challenge < ApplicationRecord
  belongs_to :user
  has_many :tagged_challenges, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { in: 10..10_000 }
end
