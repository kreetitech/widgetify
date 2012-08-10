#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('http://vimeo.com/7100569',{ :provider => 'vimeo', :format => 'json'}, :parse_oembed)
  end

  it "checking the title" do
    title = @widgetify.parse_result["oembed"]["title"]
    title.should == "Brad!"
  end

  it "checking the width" do
    width = @widgetify.parse_result["oembed"]["width"]
    width.to_s.should == "1280"
  end

  it "checking the height" do
    height = @widgetify.parse_result["oembed"]["height"]
    height.to_s.should == "720"
  end

  it "checking the author url" do
    author = @widgetify.parse_result["oembed"]["author_name"]
    author.should == "Casey Donahue"
  end

  it "checking the provider name" do
    provider = @widgetify.parse_result["oembed"]["provider_name"]
    provider.should == "Vimeo"
  end

end
