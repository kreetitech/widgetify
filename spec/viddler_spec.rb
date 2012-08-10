#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('http://www.viddler.com/explore/cdevroe/videos/424/',{ :provider => 'viddler', :format => 'json'}, :parse_oembed)
  end

  it "checking the thumbnail height" do
    thumbnail_height = @widgetify.parse_result["oembed"]["thumbnail_height"]
    thumbnail_height.should == 349
  end

  it "checking the title" do
    title = @widgetify.parse_result["oembed"]["title"]
    title.should == "iPhone macro lens demonstration"
  end

  it "checking the width" do
    width = @widgetify.parse_result["oembed"]["width"]
    width.should == 620
  end

  it "checking the height" do
    height = @widgetify.parse_result["oembed"]["height"]
    height.should == 349
  end

  it "checking the author name" do
    author = @widgetify.parse_result["oembed"]["author_name "]
    author.should == "cdevroe"
  end

  it "checking the provider name" do
    provider = @widgetify.parse_result["oembed"]["provider_name"]
    provider.should == "Viddler"
  end

end
