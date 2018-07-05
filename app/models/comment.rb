class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :reject_username


  def reject_username(attributes)
     attributes[:username].blank?
  end

  def user_attributes=(user_attribute)
    user = User.find_or_create_by(user_attribute)
    self.user = user
  end

end
