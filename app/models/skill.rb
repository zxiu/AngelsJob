class Skill < ActiveRecord::Base
  mount_uploaders :assets, AssetUploader
  enum level: ["handle", "good", "very good"]
  enum catalog: ["job", "language", "other"]
  serialize :assets, Array

  belongs_to :user
end
