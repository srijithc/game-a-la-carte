class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :target_age_group_id
      t.string :theme
      t.string :genre
      t.string :violence
      t.float :price

      t.timestamps
    end
  end
end
