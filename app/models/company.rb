class Company < ActiveRecord::Base

  has_many :positions, dependent: :destroy
  has_many :founders, through: :positions

  has_many :affiliations, dependent: :destroy
  has_many :organizations, through: :affiliations

end
