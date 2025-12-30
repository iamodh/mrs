class Course < ApplicationRecord
  belongs_to :marathon
  # has_many :applicants, dependent: :destroy

  validates :name, presence: true, length: { in: 1..10, message: "length must be 1 ~ 10" }
  validates :capacity, presence: true, numericality: { greater_than_or_equal_to: 1 }

  # def full?
  # end
end
