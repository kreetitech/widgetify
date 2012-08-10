#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('http://www.slideshare.net/haraldf/business-quotes-for-2011',{ :provider => 'slideshare', :format => 'json'}, :parse_oembed)
  end

  it "checking the title" do
    title = @widgetify.parse_result["oembed"]["title"]
    title.should == "Business Quotes for 2011"
  end

  it "checking the width" do
    width = @widgetify.parse_result["oembed"]["width"]
    width.to_s.should == "425"
  end

  it "checking the height" do
    height = @widgetify.parse_result["oembed"]["height"]
    height.to_s.should == "355"
  end

  it "checking the author name" do
    author = @widgetify.parse_result["oembed"]["author_name"]
    author.should == "Harald Felgner"
  end

end
