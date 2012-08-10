#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'nokogiri'
require 'open-uri'
require 'json'
require_relative 'parser'

module Widgetify

  class OpenGraphParser < Parser

    def initialize(html_doc)
      super(html_doc)
      @html_doc = html_doc
      @key_arr = ['og:image','og:video','og:audio']
      open_graph_parser
    end

    protected

    def open_graph_parser
      self["images"] = look_for_metadata(@key_arr[0])
      self["videos"] = look_for_metadata(@key_arr[1])
      self["audios"] = look_for_metadata(@key_arr[2])
      basic_meta_data
    end

    def look_for_metadata(attribute)
      final_arr = []
      img_hash = { }
      @html_doc.xpath("//meta[starts-with(@property, '#{attribute}')]").each do |meta|
        image = meta.get_attribute("property")
        content = meta.get_attribute("content")
        if image == attribute
          img_hash = { }
          final_arr << img_hash
          img_hash["url"] = content
        else
          key = image.split(':').last
          img_hash[key] = content
        end
      end
      final_arr
    end

    def basic_meta_data
      @html_doc.xpath("//meta[starts-with(@property, 'og:')]").each do |meta|
        property = meta.get_attribute("property")
        self[property.split(':').last] = meta.get_attribute("content") if property.split(':').length <= 2 && !@key_arr.include?(property)
      end
    end

  end #  eof OpenGraph class
end
