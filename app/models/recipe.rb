class Recipe < ApplicationRecord
  
  belongs_to :bean_1, foreign_key: :bean_1_id, class_name: "Bean"
  belongs_to :bean_2, foreign_key: :bean_2_id, class_name: "Bean"
  belongs_to :bean_3, foreign_key: :bean_3_id, class_name: "Bean"
  
  belongs_to :user
  
  def generateQrHtml
     RQRCode::QRCode.new("/recipes/#{self.id}/edit", size: 3, level: :h).as_html
  end
  
end
