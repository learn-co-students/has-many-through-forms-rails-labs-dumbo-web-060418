class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  accepts_nested_attributes_for :categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

  # def commenters
  #   unique_users = []
  #   self.comments.each do |comment|
  #     unique_users << comment.user.username
  #   end
  #   unique_users.uniq
  # end

end
