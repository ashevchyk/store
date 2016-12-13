class AddAttachmentItemImgToMystores < ActiveRecord::Migration
  def self.up
    change_table :mystores do |t|
      t.attachment :item_img
    end
  end

  def self.down
    remove_attachment :mystores, :item_img
  end
end
