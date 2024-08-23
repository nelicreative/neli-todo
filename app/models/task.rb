class Task < ApplicationRecord
  belongs_to :workspace
  belongs_to :user
  acts_as_taggable_on :tags
  enum priority: { low: 0, medium: 1, high: 2 }
  scope :by_title, ->(search) { where("title ILIKE ?", "%#{search}%") if search.present? }
  scope :by_date, ->(date) { where("DATE(time_start) = ?", date) if date.present?  }
end
