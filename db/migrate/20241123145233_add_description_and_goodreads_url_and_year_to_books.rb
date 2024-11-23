class AddDescriptionAndGoodreadsUrlAndYearToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :description, :text
    add_column :books, :goodreads_url, :string
    add_column :books, :year, :integer
  end
end
