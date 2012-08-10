#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do

  before :each do
    @widgetify = Widgetify::Base.new('http://vimeo.com/7100571')
  end

  it "checking the json response of the url" do
    type = @widgetify.parse_result["oembed"]["type"]
    version = @widgetify.parse_result["oembed"]["version"]
    provider_name = @widgetify.parse_result["oembed"]["provider_name"]
    provider_url = @widgetify.parse_result["oembed"]["provider_url"]
    title = @widgetify.parse_result["oembed"]["title"]
    author_name = @widgetify.parse_result["oembed"]["author_name"]
    author_url = @widgetify.parse_result["oembed"]["author_url"]
    is_plus = @widgetify.parse_result["oembed"]["is_plus"]
    width = @widgetify.parse_result["oembed"]["width"]
    height = @widgetify.parse_result["oembed"]["height"]
    duration = @widgetify.parse_result["oembed"]["duration"]
    description = @widgetify.parse_result["oembed"]["description"]
    thumbnail_url = @widgetify.parse_result["oembed"]["thumbnail_url"]
    thumbnail_width = @widgetify.parse_result["oembed"]["thumbnail_width"]
    thumbnail_height = @widgetify.parse_result["oembed"]["thumbnail_height"]
    video_id = @widgetify.parse_result["oembed"]["video_id"]

    type.should == "video"
    version.should == "1.0"
    provider_name.should == "Vimeo"
    provider_url.should == "http:\/\/vimeo.com\/"
    title.should == "Ron Young Graduation"
    author_name.should == "Jeff Selph"
    author_url.should == "http:\/\/vimeo.com\/jeffselph"
    is_plus.should == "0"
    width.should == 640
    height.should == 432
    duration.should == 1494
    description.should == "Ron speaking in chapel and accepting his diploma."
    thumbnail_url.should == "http:\/\/b.vimeocdn.com\/ts\/294\/142\/29414297_640.jpg"
    thumbnail_width.should == 640
    thumbnail_height.should == 432
    video_id.should == 7100571
  end



end
