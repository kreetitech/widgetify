#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'nokogiri'
require 'open-uri'

module Widgetify
  class Parser < Hash ###  this will be the base class
    def initialize(html_doc)
      @html_doc = html_doc
    end

    protected

    def look_for_attribute(attr, attr_value)
      meta_obj = @html_doc.xpath("//meta[@#{attr} = '#{attr_value}']")
      meta_obj.first.get_attribute('content') unless meta_obj.first.nil?
    end

    def look_for_href(attr, attr_value)
      meta_obj = @html_doc.xpath("//link[@#{attr} = '#{attr_value}']")
      meta_obj.first.get_attribute('href') unless meta_obj.empty?
    end

    def look_for_type
      oembed_type = @html_doc.xpath("//link[@type='application/json+oembed']")
      oembed_type = !oembed_type.empty? ? oembed_type : @html_doc.xpath("//link[@type='text/xml+oembed']")
      oembed_link = oembed_type.first.get_attribute('href') unless oembed_type.empty?
      type = oembed_type.first.get_attribute('type') unless oembed_type.empty?
      [oembed_link, type]
    end
  end
end

