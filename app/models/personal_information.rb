class PersonalInformation < ApplicationRecord
  belongs_to :user

  validates :name, :age, presence: true
  validates :age, numericality: true
end
