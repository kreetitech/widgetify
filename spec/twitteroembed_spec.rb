#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('https://twitter.com/sachin_rt/status/236830716179120128',{ :format => 'json', :provider => 'twitter'}, :parse_oembed)
  end

  it "checking the width" do
    width = @widgetify.parse_result["oembed"]["width"]
    width.to_s.should == "550"
  end

  it "checking the author name" do
    author = @widgetify.parse_result["oembed"]["author_name"]
    author.to_s.should == "sachin tendulkar"
  end

  it "checking the url" do
    url = @widgetify.parse_result["oembed"]["url"]
    url.should == "https://twitter.com/sachin_rt/status/236830716179120128"
  end

  it "checking the version" do
    version = @widgetify.parse_result["oembed"]["version"]
    version.should == "1.0"
  end

  it "checking the provider" do
    provider = @widgetify.parse_result["oembed"]["provider_url"]
    provider.should == "http://twitter.com"
  end

  it "checking the author_url" do
    author_url = @widgetify.parse_result["oembed"]["author_url"]
    author_url.should == "https://twitter.com/sachin_rt"
  end

end
