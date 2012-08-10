#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('http://qik.com/video/49565',{ :provider => 'qik', :format => 'json'}, :parse_oembed)
  end

  it "checking the title" do
    title = @widgetify.parse_result["oembed"]["title"]
    title.should == "Alex and i having breakfast"
  end

  it "checking the width" do
    width = @widgetify.parse_result["oembed"]["width"]
    width.should == "425"
  end

  it "checking the height" do
    height = @widgetify.parse_result["oembed"]["height"]
    height.should == "319"
  end

  it "checking the author url" do
    author = @widgetify.parse_result["oembed"]["author_url"]
    author.should == "http://qik.com/kevin"
  end

  it "checking the provider name" do
    provider = @widgetify.parse_result["oembed"]["provider_name"]
    provider.should == "qik"
  end

end
