##
# One unit of work to be done in the house.
class Chore < ApplicationRecord
  validates :title, presence: true
  validates :desc, presence: true
  validate :due_date_in_future, on: :create

  def due_date_in_future
    errors.add(:due_date, 'newer than now') unless due_date.present? && due_date > DateTime.now
  end
end
