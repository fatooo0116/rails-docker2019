class AddPimgToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :pimg, :string
  end
end
