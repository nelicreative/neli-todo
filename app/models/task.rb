class Task < ApplicationRecord
  belongs_to :workspace
  belongs_to :user
  acts_as_taggable_on :tags
  enum priority: { Low: 0, Medium: 1, High: 2 }
end
