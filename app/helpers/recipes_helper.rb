module RecipesHelper
  
  require 'chunky_png'


def qrcode_tag(text, options = {})
  content = "https://brendshop.herokuapp.com/recipes/#{@recipe.id}"
    qr = ::RQRCode::QRCode.new(content)
 return ChunkyPNG::Image.from_datastream(qr.as_png.resize(500,500).to_datastream).to_data_url
end

end
