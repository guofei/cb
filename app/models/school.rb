class School < ActiveRecord::Base
  has_many :users

  def commodities
    c = users.inject([]) do |commodities, user|
      commodities + user.commodities
    end

    c.sort do |a, b|
      b.created_at <=> a.created_at
    end
  end

  def self.regions
    self.select(:region).uniq.map{|i| i.region}
  end

  def self.region(region)
    self.where(region: region)
  end
end
