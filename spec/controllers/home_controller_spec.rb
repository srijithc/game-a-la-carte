require "rails_helper"

RSpec.describe HomeController, :type => :controller do
  describe "GET #index" do
    it "Should redirect to login if no active session" do
      get :index
      expect(redirect_to "/users/sign_in")
    end

    it "Should redirect to dashboard after login" do
      @user = User.new(email: 'test@test.com', password: "password") ## uncomment if not using FactoryBot
      # @user.confirm
      @user.build_personal_information
      @user.personal_information.name = "Test User"
      @user.personal_information.age = 18

      @user.save

      sign_in @user

      get :index

      expect(redirect_to dashboard_index_path)
    end
  end
end