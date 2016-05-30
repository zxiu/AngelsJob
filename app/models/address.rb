class Address < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true
  enum country: [:Germany, :USA]
end
