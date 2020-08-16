class DashboardController < ApplicationController
  def index
    @games = Game.by_age(current_user.personal_information.age)
    @quote = current_user.quotes.find_or_initialize_by(confirmed_at: nil)
    if @quote.persisted?
      @mycart_items = @quote.quote_items.includes(:game)
    else
      @mycart_items = QuoteItem.none
    end

    # @quote = current_user.quotes.find_or_initialize_by(confirmed_at: nil).last
  end
end
