class PersonalInfo < ActiveRecord::Base
  belongs_to :user
  enum gender: [:female, :male]

end
