class Menu < ActiveRecord::Base
  has_many :menu_items
  attr_accessible :name
  validates :name, :presence => true, :uniqueness => true
end
