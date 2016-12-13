class AddCategoryIdToMystore < ActiveRecord::Migration[5.0]
  def change
    add_column :mystores, :category_id, :integer
  end
end
