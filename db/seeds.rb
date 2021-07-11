bowie = User.create(:username => "bowie72", :email => "ziggyplayedguitar@aol.com", :password => "wasthenazz")
prince = User.create(:username => "Purple1", :email => "sexymf@hotmail.com", :password => "Wh3nD0v3sCry")

orange = Book.create(:title => "A Clockwork Orange", :author => "Anthony Burgess", :year_of_publication => 1962, :category => "Fiction", :genre => "Science Fiction", :user_id => 1, :progress => "Finished")
purple = Book.create(:title => "The Color Purple", :author => "Alice Walker", :year_of_publication => 1982, :category => "Fiction", :genre => "Epistolary", :user_id => 2, :progress => "Finished")
candide = Book.create(:title => "Candide", :author => "Voltaire", :year_of_publication => 1759, :category => "Fiction", :genre => "Satire", :user_id => 1, :progress => "In Progress")
orchid = Book.create(:title => "The Orchid Thief", :author => "Susan Orlean", :year_of_publication => 1998, :category => "Non-Fiction", :genre => "Biography", :user_id => 2, :progress => "Unread")
