class Agent < ActiveRecord::Base
  enum type: [:web, :local]
  has_and_belongs_to_many :user
end
