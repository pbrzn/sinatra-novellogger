class AddColumnsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :progress, :string
    add_column :books, :user_rating, :integer
    add_column :books, :user_review, :text
  end
end
