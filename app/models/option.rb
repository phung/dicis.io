class Option < ActiveRecord::Base
  belongs_to :event
  
  attr_accessible :name
end
