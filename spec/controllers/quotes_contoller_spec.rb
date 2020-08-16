require "rails_helper"

RSpec.describe QuotesController, :type => :controller do
  describe "POST #create" do
    before(:each) do
      @user = User.new(email: 'test@test.com', password: "password") ## uncomment if not using FactoryBot
      @user.confirm
      @user.build_personal_information
      @user.personal_information.name = "Test User"
      @user.personal_information.age = 18

      @user.save

      sign_in @user
    end

    it "Cart should be having minimum 1 game" do
      post :create
      # expect(response.content_type).to eq "text/html"
      # expect(assigns(:teams)).to eq([:team])
      # expect(response).to have_http_status(:ok)
      # expect(response.body).to include("The page you were looking for doesn't exist.")
      expect(flash[:alert]).to eq("Please select atleast one game")
    end

    it "Game addition should have successful message" do
      target_age_group = TargetAgeGroup.create(title: "18 years and older", age: 18)

      game = Game.create(name: "Stellaris", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 10)

      post :create, params: {game_ids: [game.id]}
      expect(flash[:notice]).to eq("Successfully Added to the cart")

      quote = @user.quotes.last
      game_ids = quote.quote_items.pluck(:game_id)
      expect(game_ids).to eq([game.id])
    end

    it "Quote Should have all games added in the cart" do
      target_age_group = TargetAgeGroup.create(title: "18 years and older", age: 18)

      game1 = Game.create(name: "Stellaris", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 10)
      game2 = Game.create(name: "Stellaris1", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 20)

      post :create, params: {game_ids: [game1.id, game2.id]}

      quote = @user.quotes.last
      game_ids = quote.quote_items.pluck(:game_id)
      expect(game_ids).to eq([game1.id, game2.id])
    end

    it "Quote total price should match the games total price" do
      target_age_group = TargetAgeGroup.create(title: "18 years and older", age: 18)

      game1 = Game.create(name: "Stellaris", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 10)
      game2 = Game.create(name: "Stellaris1", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 20)

      post :create, params: {game_ids: [game1.id, game2.id]}

      quote = @user.quotes.last
      quote_price = quote.quote_items.sum(:price)
      games_total = game1.price + game2.price
      expect(quote_price).to eq(games_total)
    end

    it "Place order should have successful message" do
      target_age_group = TargetAgeGroup.create(title: "18 years and older", age: 18)

      game1 = Game.create(name: "Stellaris", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 10)
      game2 = Game.create(name: "Stellaris1", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 20)

      post :create, params: {game_ids: [game1.id, game2.id]}

      post :buy

      expect(flash[:notice]).to eq("Purchase completed successfully")
    end

    it "Quote should be confirmed after purchase" do
      target_age_group = TargetAgeGroup.create(title: "18 years and older", age: 18)

      game1 = Game.create(name: "Stellaris", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 10)
      game2 = Game.create(name: "Stellaris1", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 20)

      post :create, params: {game_ids: [game1.id, game2.id]}

      post :buy

      quote = @user.quotes.last
      expect(quote.confirmed_at).not_to eq(nil)
    end
  end
end