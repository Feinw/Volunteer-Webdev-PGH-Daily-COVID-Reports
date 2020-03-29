class CreateAdmissionData < ActiveRecord::Migration[6.0]
  def change
    create_table :admission_data do |t|
      t.date :date
      t.string :covid_status
      t.string :hospital_status
      t.string :details
      t.integer :cases

      t.timestamps
    end
  end
end
