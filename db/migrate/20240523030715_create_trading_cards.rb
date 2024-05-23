class CreateTradingCards < ActiveRecord::Migration[7.1]
  def change
    create_table :trading_cards do |t|
      t.string :name
      t.string :front_image
      t.string :back_image
      t.string :move1_name
      t.text :move1_description
      t.string :move2_name
      t.text :move2_description

      t.timestamps
    end
  end
end
