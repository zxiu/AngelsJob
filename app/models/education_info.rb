class EducationInfo < ActiveRecord::Base
  belongs_to :user

  mount_uploaders :assets, AssetUploader
  serialize :assets, Array
end
