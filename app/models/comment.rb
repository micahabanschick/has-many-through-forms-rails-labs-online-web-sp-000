class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def users_attributes=(users_attributes)
    users_attributes.values.each do |users_attribute|
      user = User.find_or_create_by(users_attribute)
      self.user = user
    end
  end

end
