class Chair < ActiveRecord::Base
  belongs_to :shop
  attr_accessible :left, :status, :top
end
