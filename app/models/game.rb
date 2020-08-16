class Game < ApplicationRecord
  has_one_attached :game_picture
  belongs_to :target_age_group

  scope :by_age, ->(age) {joins(:target_age_group).where(["age <= ?", age])}
end
