class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :history, foreign_key: true
      t.string :name
      t.integer :status
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
