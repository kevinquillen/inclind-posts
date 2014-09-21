require 'csv'

posts = []
rows = CSV.read(File.path("posts.csv"))
rows.shift

rows.each do |row|
  page_title = row[1].strip
  created = row[2]
  body = row[3]
  tags = row[4].split(',')

  title = page_title.downcase
  title.gsub!(/[^0-9a-z ]/i, '')
  title.gsub!(' ', '-')

  body.gsub!('<p>', '')
  body.gsub!('</p>', "\n\n")
  body.gsub!(/\s+/, ' ')

  filename = created + '-' + title + '.md'

  File.open('posts/' + filename, 'w+') { |f|
    f.write("---\n")
    f.write("layout: journal\n")
    f.write("title: " + page_title + "\n")
    f.write("tags: \n")

    tags.each do |tag|
      f.write("- " + tag.downcase.strip + "\n")
    end

    f.write("show_chat: true\n")
    f.write("show_contacts: false\n")
    f.write("---\n\n")
    f.write(body.strip)
  }
end
