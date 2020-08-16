class QuoteItem < ApplicationRecord
  belongs_to :quote
  belongs_to :game

  validates :price, :quantity, presence: true
end
