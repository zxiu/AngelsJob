class Agent < ActiveRecord::Base
  enum country: [:de, :us]
  has_and_belongs_to_many :user
  has_many :companies
  has_many :offers
end
