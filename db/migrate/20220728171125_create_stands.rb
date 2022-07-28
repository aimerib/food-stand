class CreateStands < ActiveRecord::Migration[7.0]
  def change
    create_table :stands do |t|
      t.string :name
      t.string :facility_type
      t.string :description
      t.string :address
      t.string :permit
      t.string :status
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
