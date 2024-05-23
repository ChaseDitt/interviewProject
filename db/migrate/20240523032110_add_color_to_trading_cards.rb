class AddColorToTradingCards < ActiveRecord::Migration[7.1]
  def change
    add_column :trading_cards, :color, :string
  end
end
