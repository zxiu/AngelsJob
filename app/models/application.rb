class Application < ActiveRecord::Base
  has_one :show_cv
  belongs_to :offer
  
end
