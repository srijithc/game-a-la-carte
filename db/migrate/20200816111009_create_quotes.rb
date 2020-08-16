class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.integer :user_id
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
