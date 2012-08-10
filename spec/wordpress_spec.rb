#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('http://matt.wordpress.com/2011/07/14/clouds-over-new-york/',{ :provider => 'wordpress', :format => 'json'}, :parse_oembed)
  end

  it "checking the thumbnail height" do
    thumbnail_height = @widgetify.parse_result["oembed"]["thumbnail_height"]
    thumbnail_height.should == 330
  end

  it "checking the title" do
    title = @widgetify.parse_result["oembed"]["title"]
    title.should == "Clouds over New York"
  end

  it "checking the author name" do
    author = @widgetify.parse_result["oembed"]["author_name"]
    author.should == "Matt"
  end

  it "checking the provider name" do
    provider = @widgetify.parse_result["oembed"]["provider_name"]
    provider.should == "Matt on Not-WordPress"
  end

end
