class Company < ActiveRecord::Base
  has_one :address, as: :locatable, autosave: true
  has_many :contacts, as: :contactable, autosave: true
  has_many :offers

end
