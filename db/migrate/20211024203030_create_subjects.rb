class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.references :book, null: false, foreign_key: true
      t.string :subject
      t.integer :likes

      t.timestamps
    end
  end
end
