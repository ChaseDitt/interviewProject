class AddUserToTradingCards < ActiveRecord::Migration[7.1]
  def change
    add_reference :trading_cards, :user, null: false, foreign_key: true
  end
end
