require 'rails_helper'

RSpec.describe Quote, type: :model do

  describe "Associations" do
    it { expect(Quote.reflect_on_association(:user).macro).to eq(:belongs_to) }
    it { expect(Quote.reflect_on_association(:quote_items).macro).to eq(:has_many) }
  end
end
