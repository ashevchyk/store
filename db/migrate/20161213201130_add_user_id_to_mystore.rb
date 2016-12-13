class AddUserIdToMystore < ActiveRecord::Migration[5.0]
  def change
    add_column :mystores, :user_id, :integer
  end
end
