class Application < ActiveRecord::Base
  has_one :show_cv
  belongs_to :offer
  belongs_to :user
end
