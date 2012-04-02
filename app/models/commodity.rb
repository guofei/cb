class Commodity < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  validates :photo, :file_size => { :maximum => 1.megabytes.to_i }

  has_many :commodity_cates
  has_many :categories, :through => :commodity_cates

  has_many :orders
  has_many :comments

  belongs_to :user

  def self.search(keywords)
    con = ""
    i = 0
    keywords.each { |keyword|
      con = "name like '%#{keyword}%' " if i == 0
      con += "or name like '%#{keyword}%' " if i > 0
      i += 1
    }
    con += "AND num > 0"
    where(con)
  end
end
