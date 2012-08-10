#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'nokogiri'
require 'open-uri'

module Widgetify

  class ImageInfo

    def initialize(html_doc)
      @img_doc = html_doc.xpath("//img")
      @image = []
    end

    def look_for_images
      image = []
      @img_doc.each do |attr|
        img_hash = { }
        img_hash["src"] = attr.get_attribute("src")
        img_hash["width"] = attr.get_attribute("width")
        img_hash["height"] = attr.get_attribute("height")
        img_hash["alt"] = attr.get_attribute("alt")
        img_hash["align"] = attr.get_attribute("align")
        img_hash["class"] = attr.get_attribute("class")
        img_hash["id"] = attr.get_attribute("id")
        img_hash["lang"] = attr.get_attribute("lang")
        img_hash["style"] = attr.get_attribute("style")
        img_hash["title"] = attr.get_attribute("title")
        image << img_hash
      end
      image
    end
  end
end
