class PersonalInfo < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  enum gender: [:female, :male]

end
