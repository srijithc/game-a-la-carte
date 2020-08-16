class Game < ApplicationRecord
  has_one_attached :game_picture
  belongs_to :target_age_group

  validates :name, :theme, :genre, :violence, :price, presence: true

  scope :by_age, ->(age) {joins(:target_age_group).where(["age <= ?", age])}
end
