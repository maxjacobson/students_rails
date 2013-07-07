class CreateNuggets < ActiveRecord::Migration
  def change
    create_table :nuggets do |t|
      t.integer :student_id
      t.integer :section_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
