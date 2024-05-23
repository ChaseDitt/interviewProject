class TradingCard < ApplicationRecord
  validates :name, presence: true
  validates :front_image, presence: true
  validates :back_image, presence: true
  validates :move1_name, presence: true
  validates :move1_description, presence: true
  validates :move2_name, presence: true
  validates :move2_description, presence: true
  validates :color, presence: true
end
