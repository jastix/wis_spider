require 'rubygems'
require 'spidr'

site = "http://" + ARGV.first.to_s

class String
  def starts_with?(characters)
      self.match(/^#{characters}/) ? true : false
  end
end

# build url map of a site
url_map = Hash.new { |hash, key| hash[key] = [] }

Spidr.site("#{site}") do |spider|
  spider.every_link do |origin, dest|
    url_map[dest] << origin
  end
end
File.open("url_map.txt",'w') do |f|
    url_map.each_key {|k| f.write("#{k} \n") unless !k.to_s.starts_with?("#{site}") }
    puts 'Successfully finished'
  end

