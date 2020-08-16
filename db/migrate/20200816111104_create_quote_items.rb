class CreateQuoteItems < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_items do |t|
      t.integer :quote_id
      t.integer :game_id
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
