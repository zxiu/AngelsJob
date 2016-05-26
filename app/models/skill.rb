class Skill < ActiveRecord::Base
  mount_uploaders :assets, AssetUploader
  serialize :assets, Array
  
  belongs_to :user
end
