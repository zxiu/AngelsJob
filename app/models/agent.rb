class Agent < ActiveRecord::Base
  enum locate: [:online, :offline]
  has_and_belongs_to_many :user
end
