class User < ActiveRecord::Base
  has_secure_password
  has_many :books

  # extend Slugifiable
  #
  # def slug
  #   slug = self.username.downcase.gsub(" ", "-")
  # end
end
