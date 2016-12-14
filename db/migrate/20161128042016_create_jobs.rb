class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :date_created
      t.text :bio
      t.string :employee_creator
      t.string :materials_needed
      t.belongs_to :user

      t.timestamps
    end
  end
end
