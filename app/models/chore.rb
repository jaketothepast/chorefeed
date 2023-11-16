##
# One unit of work to be done in the house.
class Chore < ApplicationRecord
  require 'date'

  enum priority: %i(low_priority, medium_priority, high_priority)

  validates :title, presence: true
  validates :desc, presence: true
  validate :due_date_in_future, on: :create
  before_save :cannot_recomplete
  before_update :cannot_recomplete

  def due_date_in_future
    errors.add(:due_date, 'newer than now') unless due_date.present? && due_date > DateTime.now
  end

  def cannot_recomplete
    !completed_at.nil?
  end
end
