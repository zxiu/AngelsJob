class CvTemplate < ActiveRecord::Base
  enum role: [:cover_letter]
end
