require 'open-uri'

class StudentScraper

  def initialize
    index_doc = fetch_doc("http://students.flatironschool.com/")
    links = index_doc.search(".blog-title a")
      .collect{|link| "http://students.flatironschool.com/#{link.attr("href")}".downcase}
      .delete_if{|url| url == "http://students.flatironschool.com/#"}
      .uniq # because matt shows up twice
    links.each_with_index do |link, index|
      doc = fetch_doc(link) #=> returns nokogiri doc
      student = scrape_student_info(doc) #=> student hash
      content = scrape_content_info(doc, index) #=> array of content hashes
      Student.create(student)
      Nugget.create(content)
    end
  end

  def fetch_doc(url)
    response = open(url)
    ::Nokogiri::HTML(response)
  end

  def scrape_student_info(doc)
    student = {}
    student[:name] = doc.search(".ib_main_header").text
    student[:image_url] = doc.search("img.student_pic").attr("src").value
    student[:tagline] = doc.search(".quote-div h3").text

    social_links = doc.search(".social-icons a").collect { |link| link.attr("href") }
    student[:twitter_url]  = social_links[0]
    student[:linkedin_url] = social_links[1]
    student[:github_url]   = social_links[2]
    student[:blog_url]     = social_links[3]

    coder_cred_links = doc.search(".coder-cred a").collect { |link| link.attr("href") }
    student[:treehouse_url]  = coder_cred_links[1]
    student[:codeschool_url] = coder_cred_links[2]
    student[:coderwall_url]  = coder_cred_links[3]
    return student
  end

  def scrape_content_info(doc, student_id)
    content = []
    boxes = doc.search("div.services")
    boxes.each_with_index do |box, index|
      content_box = {}
      content_box[:student_id] = student_id + 1
      content_box[:section_id] = index + 1
      content_box[:title] = box.search("h3").text
      content_box[:body] = box.text.strip.split("\n")[1..-1].join("\n").strip.gsub(/ {1,}/,' ')
      content << content_box
    end
    return content
  end


end
