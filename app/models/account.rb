class Account < ActiveRecord::Base
  belongs_to :user
  
  # this should be removed if STI needs to be used
  self.inheritance_column = :unecessary
end
