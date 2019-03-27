class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :code, null:false
      t.string :name, null:false
      t.boolean :active, null:true
      t.timestamps
    end
  end
end
