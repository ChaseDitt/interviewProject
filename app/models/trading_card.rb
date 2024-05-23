class TradingCard < ApplicationRecord
  belongs_to :user
  has_one_attached :front_image
  has_one_attached :back_image

  validates :name, presence: true
  validates :move1_name, presence: true
  validates :move1_description, presence: true
  validates :move2_name, presence: true
  validates :move2_description, presence: true
  validates :color, presence: true
end
