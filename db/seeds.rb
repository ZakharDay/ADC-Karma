require 'curb'

@minor_list_url = 'https://electives.hse.ru/catalog2019'

def seed
  clean_db
  get_minor_list
end

def clean_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def get_minor_list
  @city = ''
  @faculty = ''
  
  html = Curl.get(@minor_list_url)
  body_html = Nokogiri::HTML(html.body_str)
  post_text_html = body_html.css('.post__text')

  post_text_html.children.each do |entry|
    puts entry.name

    if entry.name == 'h3'
      @city = entry.content.split.map(&:capitalize).join(' ')
      puts @city
    end

    if entry.name == 'h4'
      @faculty = entry.content.capitalize
      puts @faculty
    end

    if entry.name == 'p'
      entry.children.each do |paragraph_entry|
        if paragraph_entry.name == 'a'
          puts @city
          puts @faculty
          name = paragraph_entry.content
          page_url = paragraph_entry[:href]

          minor = Minor.create!(city: @city, faculty: @faculty, name: name, page_url: page_url)

          puts name
          puts page_url
          puts minor.id
        end
      end
    end

    puts "========="
  end

  # puts post_text_html.entries
end

seed
