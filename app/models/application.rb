class Application < ActiveRecord::Base
  has_one :show_cv
  belongs_to :offer

  def applied?
    !self.applied_at.blank?
  end


end
