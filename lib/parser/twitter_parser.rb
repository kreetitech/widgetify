#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'nokogiri'
require 'open-uri'
require_relative 'parser'

module Widgetify

  class TwitterParser < Parser

    def initialize(html_doc)
      super(html_doc)
      @html_doc = html_doc
      twitter_parser
    end

    protected

    def twitter_parser
      @html_doc.xpath("//meta[starts-with(@name, 'twitter:')]").each do |meta|
        twt = meta.get_attribute("name").split(':').last
        content = meta.get_attribute("value")
        self[twt] = content
      end
    end

  end #  eof Twitter class
end
