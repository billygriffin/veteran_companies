class Organization < ActiveRecord::Base

  has_many :affiliations, dependent: :destroy
  has_many :companies, through: :affiliations

end
