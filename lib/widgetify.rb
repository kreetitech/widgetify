#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'nokogiri'
require 'open-uri'
require 'parser/oembed_parser'
require 'parser/open_graph_parser'
require 'parser/html_parser'
require 'parser/twitter_parser'

module Widgetify

  class Base
    attr_reader :parse_result

    def initialize(url, options = {}, *args)
      @content_type = open(url){|u| u.content_type}
      @parse_result = { }
      @options = options
      @options[:url] = url
      if @content_type.include?("text")
        @html_doc = Nokogiri::HTML(open(url))
        parse_all if args.length == 0
        args.each{ |arg| send(arg.to_sym)} if args.length > 0
      elsif @content_type.include?("image")
        parse_image_url if args.include?("parse_image_url".to_sym)
      end  
    end

    def parse_open_graph
      @parse_result['open_graph'] = Widgetify::OpenGraphParser.new(@html_doc)
    end

    def parse_oembed
      @parse_result['oembed'] = Widgetify::OembedParser.new(@html_doc, @options)
    end

    def parse_html
      @parse_result['html'] = Widgetify::HTMLParser.new(@html_doc)
    end

    def parse_twitter
      @parse_result['twitter'] = Widgetify::TwitterParser.new(@html_doc)
    end

    def parse_all
      parse_open_graph
      parse_oembed
      parse_html
    end
  
    def parse_image_url
      @parse_result['image'] = {:url => @options[:url], :type => "photo"} if @content_type.include?("image")
    end
  end
end
