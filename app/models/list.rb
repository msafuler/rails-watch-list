class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, uniqueness: true, presence: true, allow_blank: false
  validates :poster_url, presence: true, allow_blank: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
