#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.

require 'open-uri'
require 'json'
require_relative 'parser'
module Widgetify
  API_END_POINTS = {
    :youtube => 'http://www.youtube.com/oembed',
    :flickr => 'http://flickr.com/services/oembed',
    :viddler => 'http://lab.viddler.com/services/oembed/',
    :qik => 'http://qik.com/api/oembed.',
    :revision3 => 'http://revision3.com/api/oembed/',
    :hulu => 'http://www.hulu.com/api/oembed.',
    :vimeo => 'http://vimeo.com/api/oembed.',
    :collegehumor => 'http://www.collegehumor.com/oembed.',
    :oohembed => 'http://oohembed.com/oohembed/',
    :polleverywhere => 'http://polleverywhere.com/services/oembed',
    :opera => 'http://my.opera.com/service/oembed/',
    :embed => 'http://api.embed.ly/1/oembed',
    :ifixit => 'http://www.ifixit.com/Embed',
    :smugmug => 'http://api.smugmug.com/services/oembed/',
    :slideshare => 'http://www.slideshare.net/api/oembed/2',
    :wordpress => 'http://public-api.wordpress.com/oembed/1.0/',
    :quickmeme => 'http://api.embed.ly/1/oembed'
  }
  class OembedParser < Parser
    def initialize(html_doc, options = {})
      super(html_doc)
      @html_doc = html_doc
      @options = options
      @options[:format] = 'json' if !@options[:format]
      oembed_parse
    end

    protected

    def oembed_parse
      @link, type = look_for_type
      if type
        if type.scan('json').length > 0
          @type = 'json'
        elsif type.scan('xml').length > 0
          @type = 'xml'
        end
        get_proper_response(type)
      else
        response_type_not_present
      end
    end

    def response_type_not_present
      api = API_END_POINTS[@options[:provider].to_sym]
      @link = api[api.length - 1] == '.' ? api.to_s+@options[:format] : api.to_s+"?url="+@options[:url]
      @link +=  "?url="+@options[:url] if @link.include?('json') || @link.include?('xml')
      @link += "&format=" + @options[:format] if @options[:format] && api.scan(@options[:format])
      get_proper_response(@options[:format])
    end

    def get_proper_response(type)
      case type
      when /json/ then get_json
      when /xml/ then get_xml
      end
    end

    ####   here the json response will be parsed

    def get_json
      @link += "&maxwidth=" + @options[:maxwidth] if @options[:maxwidth]
      @link += "&maxheight=" + @options[:maxheight] if @options[:maxheight]
      p @link
      obj = open(@link){ |f| f.read}
      JSON.parse(obj).each{ |key, val| self[key] = val} if JSON.parse(obj)
    end

  ###########  here the xml response will be parsed.
    def get_xml
      @link += "&maxwidth=" + @options[:maxwidth] if @options[:maxwidth]
      @link += "&maxheight=" + @options[:maxheight] if @options[:maxheight]
      xml = Nokogiri::XML(open(@link))
      xml.xpath('/oembed').children.each do |row|
        self[row.name] = row.text
      end
    end
  end  #eof OembedParser

end
