require 'rails_helper'

RSpec.describe Quote, type: :model do

  describe "Associations" do
    it { expect(Game.reflect_on_association(:target_age_group).macro).to eq(:belongs_to) }
  end

  describe "Scopes" do
    it "Should return games by age" do
      target_age_group = TargetAgeGroup.create(title: "18 years and older", age: 18)

      game1 = Game.create(name: "Stellaris", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 10)
      game2 = Game.create(name: "Stellaris1", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 20)


      target_age_group = TargetAgeGroup.create(title: "13 years and older", age: 13)

      game3 = Game.create(name: "Stellaris2", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 10)
      game4 = Game.create(name: "Stellaris3", target_age_group: target_age_group, theme: "War", genre: "Strategy", violence: "None", price: 20)

      expect(Game.by_age(14).count).to eq(2)
      expect(Game.by_age(19).count).to eq(4)
    end
  end
end
