#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do

  before :each do
    @widgetify = Widgetify::Base.new('http://www.youtube.com/watch?v=IOYyCHGWJq4&feature=g-all-esi',{ },:parse_open_graph)
  end

  it "checking the width of the open graph video protocol" do
    width = @widgetify.parse_result["open_graph"]["videos"].first["width"]
    width.should == "1280"
  end

  it "checking the height of the open graph video protocol" do
    height = @widgetify.parse_result["open_graph"]["videos"].first["height"]
    height.should == "720"
  end

  it "checking the type of the open grpah video protocol" do
    type = @widgetify.parse_result["open_graph"]["videos"].first["type"]
    type.should == "application/x-shockwave-flash"
  end

  it "checking the url of the open graph video protocol" do
    url = @widgetify.parse_result["open_graph"]["videos"].first["url"]
    url.should == "http://www.youtube.com/v/IOYyCHGWJq4?version=3&autohide=1"
  end

end
