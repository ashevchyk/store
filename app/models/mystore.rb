class Mystore < ApplicationRecord

  belongs_to :category
  belongs_to :user

  has_attached_file :item_img, styles: {item_index: "250x250>", item_show: "350x500>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :item_img, content_type: /\Aimage\/.*\z/
end
