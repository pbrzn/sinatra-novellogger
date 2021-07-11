class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year_of_publication
      t.string :category
      t.string :genre
      t.integer :user_id
    end
  end
end
