class Raffel < ApplicationRecord

  has_many :users, dependent: :destroy
end
