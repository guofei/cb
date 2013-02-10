class Commodity < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  validates :photo, :file_size => { :maximum => 0.5.megabytes.to_i }
  validates_length_of :name, :in => (2..40)
  validates :num, :price, :numericality => { :greater_than_or_equal_to => 0 }
  validates_numericality_of :num, :user_id, :only_integer => true
  validates_numericality_of :price
  has_many :commodity_cates
  has_many :categories, :through => :commodity_cates

  has_many :alerts
  has_many :orders
  has_many :comments
  belongs_to :user

  def self.search(keywords)
    @keywords = keywords.class == String ? [keywords] : keywords
    sql = @keywords.inject("") do |sql, keyword|
      sql = sql == "" ? sql + "name like '%#{keyword}%' " : sql + "or name like '%#{keyword}%' "
    end
    sql += "AND num > 0"
    where(sql)
  end
end
