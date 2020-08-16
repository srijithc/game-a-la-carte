class QuoteItem < ApplicationRecord
  belongs_to :quote
  belongs_to :game
end
