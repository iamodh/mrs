class Registration < ApplicationRecord
  belongs_to :course

  enum :status, { active: 0, refunded: 1, cancelled: 2 }

  validates :name, :date_of_birth, :phone, presence: true
  validates :phone, uniqueness: { scope: :course_id, message: "이미 신청하신 내역이 있습니다." }

end
