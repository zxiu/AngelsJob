class Intent < ActiveRecord::Base
  belongs_to :user
  enum branch: ["Computer Science", "Education", "Social Services"]
  enum job_type: ["Full day", "Half day", "Practice"]
end
