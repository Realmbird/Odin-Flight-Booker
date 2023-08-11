class Passenger < ApplicationRecord
  validates :name, presence: true, length: { in: 1..128 }
  validates :email, presence: true, length: { in: 1..128 }
  belongs_to :booking
end
