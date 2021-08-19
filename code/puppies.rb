#!/usr/bin/env ruby

# Build a scraper for a dog adoption website. This scraper should open the paws.html page and collect all baby female dogs on each page. The scraper
# should return the href sources for each matching dog. The DIRECTORY constant contains directory containing paws.html.
#
# Hint: You will likely want to use an HTML parser like Nokogiri and use the page's pagination to iterate each page.
#
require 'nokogiri'

class Puppies
  DIRECTORY = ::File.join(::File.dirname(__FILE__), '../data')

  def self.parse
    puppies_path = []
    files_arr = []

    # getting all href files in pagination
    document = Nokogiri::HTML(File.read(DIRECTORY+"/paws.html"))
    document.css('.pagination .page-link').each do |d|
      files_arr.push(d.attributes["href"].value)
    end

    # removing dupicates
    files = files_arr.uniq.reject { |file| file == '#' }

    # searching through all the files and pushing to array
    files.each do |file|
      document = Nokogiri::HTML(File.read(DIRECTORY+"/"+file))
      document.search('a:contains("Female - Baby")').each do |doc|
        puppies_path.push(doc.attributes["href"].value)
      end
    end

    return puppies_path
  end
end
