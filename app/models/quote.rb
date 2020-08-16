class Quote < ApplicationRecord
  has_many :quote_items
  belongs_to :user

  scope :unconfirmed, -> {where(confirmed_at: nil)}

  #
  # self.add_to_quote
  # @param {Array} game_ids
  # @param {ActiveRecord} user
  #
  def self.add_to_quote(user, game_ids)
    Quote.transaction do
      quote = user.quotes.find_or_initialize_by(confirmed_at: nil)
      quote.save

      @games = Game.by_age(user.personal_information.age).where(id: game_ids)

      @games.each do |game|
        quote_item = quote.quote_items.new
        quote_item.game = game
        quote_item.price = game.price
        quote_item.quantity = 1
        quote_item.save
      end
    end
  end

  #
  # confirm!
  #
  def confirm!
    self.update_attribute(:confirmed_at, Time.now())
  end
end
