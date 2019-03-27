class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
    	t.string :code, null:false, uniqueness:true
			t.string :firstname, null:false
			t.string :middlename, null:true
			t.string :lastname, null:false
			t.string :birthdate, null:false
			t.string :address, null:false
			t.string :contactno, null:false
			t.string :dateHired, null:false
			t.string :dateRegular, null:true
			t.string :dateFired, null:true
			t.integer :departmentId, null:true
			t.timestamps
    end
  end
end
