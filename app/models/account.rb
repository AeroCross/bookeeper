class Account < ActiveRecord::Base
  belongs_to :user
  
  # this should be removed if STI needs to be used
  self.inheritance_column = :unecessary

  def self.find_all_by_user_id(user_id)
    where(:user_id => user_id)
  end
end
