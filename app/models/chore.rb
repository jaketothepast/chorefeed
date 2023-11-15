##
# One unit of work to be done in the house.
class Chore < ApplicationRecord
  require 'date'

  validates :title, presence: true
  validates :desc, presence: true
  validate :due_date_in_future, on: :create
  validate :cannot_recomplete, on: :update

  def due_date_in_future
    errors.add(:due_date, 'newer than now') unless due_date.present? && due_date > DateTime.now
  end

  def cannot_recomplete
    errors.add(:completed_at, 'already complete') if completed_at_changed? && completed_at.present?
  end
end
