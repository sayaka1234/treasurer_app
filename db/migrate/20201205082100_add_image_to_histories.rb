class AddImageToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :image, :string
  end
end
