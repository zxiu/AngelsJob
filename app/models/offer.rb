class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  belongs_to :agent
  has_many :applications
end
