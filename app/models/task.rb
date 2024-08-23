class Task < ApplicationRecord
  belongs_to :workspace
  belongs_to :user
  acts_as_taggable_on :tags
end
