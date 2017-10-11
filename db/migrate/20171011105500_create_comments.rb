class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      # null false is to ensure that when an empty comment is created, it isn't added to the table
      t.references :user, foreign_key: true
      t.references :photo, foreign_key: true
      t.timestamps
      end
  end
end
