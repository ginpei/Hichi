class Shop < ActiveRecord::Base
  has_many :chairs
  attr_accessible :name, :screen_name

  def to_param
    screen_name
  end
end
