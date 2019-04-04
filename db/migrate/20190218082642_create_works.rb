class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title
      t.string :sub_title
      t.text :content
      t.integer :user_id
      t.string :tag
      t.datetime :create_at

      t.timestamps
    end
  end
end
