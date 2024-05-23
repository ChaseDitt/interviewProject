FactoryBot.define do
  factory :trading_card do
    name { "Test Card" }
    front_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/logo.png'), 'image/png') }
    back_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/logo.png'), 'image/png') }
    move1_name { "Move 1" }
    move1_description { "Description 1" }
    move2_name { "Move 2" }
    move2_description { "Description 2" }
    color { "#FFFFFF" }
    association :user
  end
end
