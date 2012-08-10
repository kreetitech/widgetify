#Copyright (c) 2012, Kreeti Technologies All Rights Reserved.
require 'spec_helper'

describe Widgetify::Base do
  before :each do
    @widgetify = Widgetify::Base.new('http://vimeo.com/7100571',{ },:parse_html)
  end


  it "checking the title of the url" do
    title = @widgetify.parse_result["html"]["title"]
    title.should == "Ron Young Graduation on Vimeo"
  end

  it "checking the canonical_url of the url" do
    canonical_url = @widgetify.parse_result["html"]["canonical_url"]
    canonical_url.should == "/7100571"
  end

  it "checking the description of the url" do
    description = @widgetify.parse_result["html"]["description"]
    description.should == "Ron speaking in chapel and accepting his diploma."
  end

end
