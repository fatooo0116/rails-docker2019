class CreateCals < ActiveRecord::Migration[5.2]
  def change
    create_table :cals do |t|

      t.string :cname
      t.text :cdesc
      t.string :ccontact
      t.string :ctel      
      t.datetime :start_at
      t.datetime :expire_at

      t.timestamps
    end
  end
end
