module Slugifiable
  def find_by_slug(slug)
    self.all.find {|i| i.slug == slug }
  end
end
