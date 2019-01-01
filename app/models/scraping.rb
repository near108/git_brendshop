class Scraping

def self.arrange_hot
  links = []
  agent = Mechanize.new
  next_url = "/enjoy/recipe/arrange_hot/index.html"
  
  while true
    current_page = agent.get("https://www.ucc.co.jp#{next_url}")
    url_lists = current_page.search('.ucc-m-recipe-thumbs__item a')
    url_lists.each do |ur|
    links << ur.get_attribute('href')
    end
  
    next_link = current_page.at('.ucc-m-paginate__next')
    break unless next_link
    next_url = next_link.get_attribute('href')
  end
  
  links.each do |link|
    self.arrange_text('https://www.ucc.co.jp' + link)
  end
end

def self.arrange_ice
  links = []
  agent = Mechanize.new
  next_url = "/enjoy/recipe/arrange_ice/index.html"
  
  while true
    current_page = agent.get("https://www.ucc.co.jp#{next_url}")
    url_lists = current_page.search('.ucc-m-recipe-thumbs__item a')
    url_lists.each do |ur|
    links << ur.get_attribute('href')
    end
  
    next_link = current_page.at('.ucc-m-paginate__next')
    break unless next_link
    next_url = next_link.get_attribute('href')
  end
  
  links.each do |link|
    self.arrange_text('https://www.ucc.co.jp' + link)
  end
end


def self.arrange_text(link)
  agent = Mechanize.new
  page = agent.get(link)
  cat = page.at('.ucc-m-recipe-main__cat').inner_text if page.at('.ucc-m-recipe-main__cat')
  title = page.search('.ucc-m-recipe-main__h p').inner_text if page.search('.ucc-m-recipe-main__h p')
  info = page.at('.ucc-m-recipe-main__lead').inner_text if page.at('.ucc-m-recipe-main__lead')
  text = page.search('.ucc-m-procedure__item p').inner_text if page.search('.ucc-m-procedure__item p')
  fig = page.at('.ucc-m-recipe-main__captions__fig img').get_attribute('src') if page.search('.ucc-m-recipe-main__captions__fig img')
  
  arrange = Arrange.where(category: cat, title: title, info: info, howto: text, image_url: fig).first_or_initialize
  arrange.save
end


end
