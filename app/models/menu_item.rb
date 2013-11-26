class MenuItem < ActiveRecord::Base
  belongs_to :menu
  attr_accessible :name, :priced
end