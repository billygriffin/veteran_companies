class Affiliation < ActiveRecord::Base

  belongs_to :organization
  belongs_to :company
end
