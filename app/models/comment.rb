class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def users_attributes=(users_attributes)
    users_attributes.values.each do |users_attribute|
      users = User.find_or_create_by(users_attribute)
      self.post_users.build(user: user)
    end
  end

end
