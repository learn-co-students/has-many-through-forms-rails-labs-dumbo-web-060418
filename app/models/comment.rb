class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user 

  def user_attributes=(attrs)
     if !attrs['username'].empty?
       user = User.create(attrs)
       self.user = user
     end
  end
end
