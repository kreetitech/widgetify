#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('http://imgur.com/gallery/p6ylj',{ },:parse_html)
  end


  it "checking the title of the url" do
    title = @widgetify.parse_result["html"]["title"]
    title.should == "\t\t\tI want to know which one of you owns this bar - Imgur\n\t"
  end

  it "checking the canonical_url of the url" do
    canonical_url = @widgetify.parse_result["html"]["canonical_url"]
    canonical_url.should == "/7100571"
  end

  it "checking the description of the url" do
    description = @widgetify.parse_result["html"]["description"]
    description.should == "Imgur is used to share photos with social networks and online communities, and has the funniest pictures from all over the Internet."
  end

  it "checking the image description" do
    description = @widgetify.parse_result["html"]["img_src"]
    description.should == "http://i.imgur.com/p6ylj.jpg"
  end


end
