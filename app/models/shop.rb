class Shop < ActiveRecord::Base
  attr_accessible :name, :screen_name

  def to_param
    screen_name
  end
end
