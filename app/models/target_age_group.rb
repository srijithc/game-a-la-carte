class TargetAgeGroup < ApplicationRecord
  has_many :games

  validates :title, :age, presence: true
end
