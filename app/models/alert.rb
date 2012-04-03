class Alert < ActiveRecord::Base
  belongs_to :commodity
  belongs_to :user
end
