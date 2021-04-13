class Task < ApplicationRecord
  belongs_to :project
  validates :name, :project_id, presence: true 
end
