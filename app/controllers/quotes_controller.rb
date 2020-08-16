class QuotesController < ApplicationController
  #
  # create
  # Initialize and creates the cart
  #
  def create
    # ss
    if params[:game_ids].present?
      Quote.add_to_quote(current_user, params[:game_ids])
      flash[:notice] = "Successfully Added to the cart"
    else
      flash[:alert] = "Please select atleast one game"
    end

    redirect_to dashboard_index_path
  end

  #
  # update
  # Adds more to the cart
  #
  def update
    create
  end

  #
  # buy
  # Takes care of final checkout
  #
  def buy
    @quote = current_user.quotes.unconfirmed.last
    if @quote.present?
      @quote.confirm!
      flash[:notice] = "Purchase completed successfully"
    else
      flash[:alert] = "Cart is empty"
    end

    redirect_to dashboard_index_path
  end
end
