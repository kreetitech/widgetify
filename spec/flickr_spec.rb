#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('http://flickr.com/photos/bees/2362225867/',{ :provider => 'flickr', :format => 'json'}, :parse_oembed)
  end

  it "checking the thumbnail height" do
    thumbnail_height = @widgetify.parse_result["oembed"]["thumbnail_height"]
    thumbnail_height.should == 75
  end

  it "checking the title" do
    title = @widgetify.parse_result["oembed"]["title"]
    title.should == "Bacon Lollys"
  end

  it "checking the width" do
    width = @widgetify.parse_result["oembed"]["width"]
    width.should == "1024"
  end

  it "checking the height" do
    height = @widgetify.parse_result["oembed"]["height"]
    height.should == "768"
  end

  it "checking the provider name" do
    provider = @widgetify.parse_result["oembed"]["provider_name"]
    provider.should == "Flickr"
  end

end
