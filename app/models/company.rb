class Company < ActiveRecord::Base

  has_many :positions, dependent: :destroy
  has_many :leaders, through: :positions

  has_many :affiliations, dependent: :destroy
  has_many :organizations, through: :affiliations

  def self.published
    where(status: 'published')
  end

  def self.pending
    where(status: 'pending')
  end

  def publish
    self.status = "published"
  end

  def take_offline
    self.status = "pending"
  end

  def published?
    self.status == "published"
  end

  def pending?
    self.status == "pending"
  end

end
