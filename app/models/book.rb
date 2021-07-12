class Book < ActiveRecord::Base
  belongs_to :user

  # extend Slugifiable
  #
  # def slug
  #   slug = self.title.downcase.gsub(" ", "-").delete(".,?!$()'")
  # end
end
