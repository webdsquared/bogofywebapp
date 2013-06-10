class Item < ActiveRecord::Base
  attr_accessible :name, :complete

  belongs_to :list
  
end
