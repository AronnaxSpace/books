class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :original_name
      t.string :wikipedia_url
      t.belongs_to :user

      t.timestamps
    end
  end
end
