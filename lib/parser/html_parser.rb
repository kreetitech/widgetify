#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.

require 'nokogiri'
require 'open-uri'
require_relative 'parser'
require_relative 'image_parser'

module Widgetify

 class HTMLParser < Parser

   def initialize(html_doc)
     super(html_doc)
     @html_doc = html_doc
     html_parser
   end

   def html_parser
     self['title'] = @html_doc.xpath('//title').text
     self['canonical_url'] = canonical_url
     self['description'] = description
     self['images'] = images
   end

   private

   def description
     look_for_attribute('name', 'description')
   end

   def canonical_url
     look_for_href('rel', 'canonical')
   end

   def images
     image = Widgetify::ImageInfo.new(@html_doc)
     image.look_for_images
   end
 end
end
