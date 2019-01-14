module RecipesHelper
  
  require 'chunky_png'


def qrcode_tag(text, options = {})
  host = if Rails.env == "production"
    "https://brendshop.herokuapp.com"
  elsif Rails.env == "development"
    "https://6abbc759ee4344c4a987c8f208688682.vfs.cloud9.ap-southeast-1.amazonaws.com"
  end
  content = host + "/recipes/#{@recipe.id}"
    qr = ::RQRCode::QRCode.new(content)
 return ChunkyPNG::Image.from_datastream(qr.as_png.resize(500,500).to_datastream).to_data_url
end

end
