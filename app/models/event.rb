class Event < ActiveRecord::Base
  has_many :options
  
  attr_accessible :name
end
