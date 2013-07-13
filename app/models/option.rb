class Option < ActiveRecord::Base
  belongs_to :event
  
  attr_accessible :name, :eventId
  
  def self.select_public
    select('name')
  end
end
