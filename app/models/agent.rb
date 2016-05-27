class Agent < ActiveRecord::Base
  enum country: [:de, :us]
  has_and_belongs_to_many :user
end
