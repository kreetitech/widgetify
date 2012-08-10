#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('http://www.smugmug.com/popular/all%23125787395_hQSj9',{ :provider => 'smugmug', :format => 'json'}, :parse_oembed)
  end

  it "checking the title" do
    title = @widgetify.parse_result["oembed"]["title"]
    title.should == "Great Egret at dusk"
  end

  it "checking the width" do
    width = @widgetify.parse_result["oembed"]["width"]
    width.to_s.should == "600"
  end

  it "checking the height" do
    height = @widgetify.parse_result["oembed"]["height"]
    height.to_s.should == "400"
  end

  it "checking the author name" do
    author = @widgetify.parse_result["oembed"]["author_name"]
    author.should == "Jean-Luc Vaillant"
  end

end
