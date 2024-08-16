class Task < ApplicationRecord
  belongs_to :workspace
  acts_as_taggable_on :tags
end
