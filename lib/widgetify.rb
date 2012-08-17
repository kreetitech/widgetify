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
      @html_doc = Nokogiri::HTML(open(url))
      @parse_result = { }
      @options = options
      @options[:url] = url
      parse_all if args.length == 0
      args.each{ |arg| send(arg.to_sym)} if args.length > 0
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
  end
end
