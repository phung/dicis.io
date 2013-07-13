class Option < ActiveRecord::Base
  belongs_to :event
  
  attr_accessible :name
  
  def self.select_public
    select('name')
  end
end
