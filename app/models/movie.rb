class Movie < ApplicationRecord
  belongs_to :list, optional: true
  has_many :bookmarks

  def destroy
    raise 'Cannot delete a movie' unless bookmarks.count.zero?

    super
  end

  validates :overview, uniqueness: true, presence: true, allow_blank: false
  validates :title, uniqueness: true, presence: true
end
