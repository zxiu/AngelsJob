class Contact < ActiveRecord::Base
  include ContactHelper
  enum gender: [:female, :male]
end
