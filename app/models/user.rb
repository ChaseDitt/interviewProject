class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (username = conditions.delete(:username))
      where(conditions.to_h).where(["lower(username) = :value", { value: username.downcase }]).first
    elsif (email = conditions.delete(:email))
      where(conditions.to_h).where(["lower(email) = :value", { value: email.downcase }]).first
    end
  end
end