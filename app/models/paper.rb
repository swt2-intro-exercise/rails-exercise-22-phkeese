class Paper < ApplicationRecord
  has_and_belongs_to_many :authors

  validates :title, presence: true
  validates :venue, presence: true
  validates :year, presence: true, numericality: true

  scope :published_in, ->(year) { where("year = ?", year) if year.present? }
end
