class User < ApplicationRecord

  belongs_to :raffel
  devise :database_authenticatable, :registerable

  validates :email, presence: true, uniqueness: { scope: :raffel }, format: {with: Devise.email_regexp}
  validates :password, presence: true, confirmation: true, length: { within: Devise.password_length}


  def winning_percentage
    (100 / raffel.users.count)
  end
end
