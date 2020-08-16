class CreatePersonalInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_informations do |t|
      t.integer :age
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
