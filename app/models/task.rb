class Task < ApplicationRecord
  belongs_to :workspace
  belongs_to :user
  acts_as_taggable_on :tags
  include AASM
  enum priority: { low: 0, medium: 1, high: 2 }
  enum status: { active: 0, completed: 1 }
  scope :by_title, ->(search) { where("title ILIKE ?", "%#{search}%") if search.present? }
  scope :by_date, ->(date) { where("DATE(time_start) = ?", date) if date.present?  }
 
  aasm column: 'status' do
    state :active, initial: true
    state :completed

    event :toggle_status do
      transitions from: :active, to: :completed
      transitions from: :completed, to: :active
    end
  end
end
