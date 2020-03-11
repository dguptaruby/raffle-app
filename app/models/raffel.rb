class Raffel < ApplicationRecord

  has_many :users, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
