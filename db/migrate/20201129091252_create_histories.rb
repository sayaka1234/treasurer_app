class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :payee
      t.string :treasurer
      t.datetime :received_day
      t.datetime :return_day
      t.text :description
      t.integer :price
      t.string :title
      t.string :category
      t.integer :status

      t.timestamps
    end
  end
end
