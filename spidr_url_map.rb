require 'rubygems'
require 'spidr'

site = "http://" + ARGV.first.to_s

class String
  def starts_with?(characters)
      self.match(/^#{characters}/) ? true : false
  end
end

# build url map of a site
url_map = Array.new

Spidr.site("#{site}") do |spider|
  spider.every_page {|page| url_map << page.url }
end
File.open("url_map.txt",'w') do |f|
    url_map.each_key {|k| f.write("#{k} \n")}
    puts 'Successfully finished'
  end

