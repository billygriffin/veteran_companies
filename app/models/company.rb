class Company < ActiveRecord::Base

  has_many :positions, dependent: :destroy
  has_many :founders, through: :positions

end
