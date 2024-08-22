class Task < ApplicationRecord
  belongs_to :workspace
  belongs_to :user
  acts_as_taggable_on :tags
  enum priority: { low: 0, medium: 1, high: 2 }
end
