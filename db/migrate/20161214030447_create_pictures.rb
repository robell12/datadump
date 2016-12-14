class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :description
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
