class CreateMystores < ActiveRecord::Migration[5.0]
  def change
    create_table :mystores do |t|
      t.string :title
      t.text :description
      t.string :price

      t.timestamps
    end
  end
end
