class PersonalInfo < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  belongs_to :user
  enum gender: [:female, :male]

  def full_name
    result = first_name unless first_name.blank?
    result += " #{last_name}" unless last_name.blank?
  end
end
