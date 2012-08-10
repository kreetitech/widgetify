#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do

  before :each do
    @widgetify = Widgetify::Base.new('http://ogp.me',{ },:parse_open_graph)
  end

  it "checking the width of the open graph image protocol" do
    width = @widgetify.parse_result["open_graph"]["images"].first["width"]
    width.should == "300"
  end

  it "checking the height of the open graph image protocol" do
    height = @widgetify.parse_result["open_graph"]["images"].first["height"]
    height.should == "300"
  end

  it "checking the type of the open graph image protocol" do
    type = @widgetify.parse_result["open_graph"]["images"].first["type"]
    type.should == "image/png"
  end

  it "checking the url of the open graph image protocol" do
    url = @widgetify.parse_result["open_graph"]["images"].first["url"]
    url.should == "http://ogp.me/logo.png"
  end

end
