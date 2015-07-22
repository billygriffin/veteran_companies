class Leader < ActiveRecord::Base

  has_many :positions, dependent: :destroy
  has_many :companies, through: :positions

  validates :name, :url, presence: true
  
end
