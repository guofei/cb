class School < ActiveRecord::Base
  has_many :users

  def self.regions
    self.select(:region).uniq.map{|i| i.region}
  end

  def self.region(region)
    self.where(region: region)
  end
end
