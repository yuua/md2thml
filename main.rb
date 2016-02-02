require 'kramdown'
require 'open-uri'
require 'nokogiri'

url = "http://yahoo.co.jp"

charset = nil
html= open(url) do |f|
  charset = f.charset
  f.read
end

page = Nokogiri::HTML.parse(html, nil, charset)
html_str = page.search('body')
html_str = Kramdown::Document.new(html_str.text).to_html

doc = Kramdown::Document.new(html_str,:input => "html")

puts doc.to_kramdown
