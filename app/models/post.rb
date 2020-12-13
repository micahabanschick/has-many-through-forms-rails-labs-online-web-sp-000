class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes)
    # category_attributes.values.each do |category_attribute|
    #   category_attribute ? category = Category.find_or_create_by(category_attribute) : nil
    #   self.categories << category
    # end
    self.categories.build(category_attributes)
  end

  def categories_attributes
    categories_attributes ? categories_attributes : nil
  end


end
