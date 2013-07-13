class Vote < ActiveRecord::Base
  belongs_to :option
  
  attr_accessible :count
end
