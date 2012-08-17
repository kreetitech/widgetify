#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('http://imgur.com/gallery/EpMth',{ }, :parse_twitter)
  end

  it "checking the site" do
    site = @widgetify.parse_result["twitter"]["site"]
    site.should == "@imgur"
  end

  it "checking the width" do
    width = @widgetify.parse_result["twitter"]["width"]
    width.to_s.should == "700"
  end

  it "checking the height" do
    height = @widgetify.parse_result["twitter"]["height"]
    height.to_s.should == "524"
  end

  it "checking the author name" do
    title = @widgetify.parse_result["twitter"]["title"]
    title.should == "Googled \"Majestic Creatures\" was not disapointed."
  end

end
