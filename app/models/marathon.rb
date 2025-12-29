class Marathon < ApplicationRecord
  validates :name, presence: true, length: { in: 1..30, message: "length must be 1 ~ 30" }
  validates :entry_start, presence: true
  validates :entry_end, presence: true
  validate :entry_end_after_entry_start

  def open?
    return false if entry_end.nil?
    Time.current.between?(entry_start, entry_end)
  end

  private

  def entry_end_after_entry_start
    return if entry_end.blank? || entry_start.blank?

    if entry_end <= entry_start
      errors.add(:entry_end, "must be after the entry start date")
    end
  end
end
