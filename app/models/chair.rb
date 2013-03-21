class Chair < ActiveRecord::Base
  belongs_to :shop
  attr_accessible :left, :status, :top

  def left
    read_attribute(:left).to_i
  end

  def top
    read_attribute(:top).to_i
  end
end
