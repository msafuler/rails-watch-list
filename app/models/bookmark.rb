class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: {
    minimum: 6,
    too_short: 'Minimum required characters count is 6!'
  }
  validates :movie, uniqueness: { scope: :list }
  validates :list, uniqueness: { scope: :movie }
end
