class CreateTargetAgeGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :target_age_groups do |t|
      t.string :title
      t.integer :min_age
      t.integer :max_age

      t.timestamps
    end
  end
end
