Widgetify
=============

Description
------------
Widgetify provides the functionality for dealing with parsing from a url. It can parse the Open Graph Protocol, Oembed URL and the HTML image tags. 
For Open Graph you can read more about the specification at [http://ogp.me](http://ogp.me) and for Oembed URL read more about the specification at [http://oembed.com/](http://oembed.com/) .

Requirements
------------
```
*   Ruby(tested with 1.9.3)
*   Nokogiri
*   Rspec(only if you want to run the tests)
```
Installation
------------
```
 gem install widgetify

 Installing from the github, include this line in your Gemfile.

 gem 'widgetify', :git => "git@github.com:funnyfarmsf/widgetify.git"
```

Usage
------------
   require 'widgetify'

### For Open Graph Parsing
```
  widgetify = Widgetify::Base.new(your_url, {}, :parse_open_graph)

  widgetify.parse_result
```

### For Oembed URL Parsing
```
  widgetify = Widgetify::Base.new(url, {:format => 'json', :maxwidth => '150', :maxheight => '250', :provider => 'provider_name'}, :parse_oembed)

  widgetify.parse_result
```
### For Html Parsing
```
  widgetify = Widgetify::Base.new(your_url, {}, :parse_html)

  widgetify.parse_result
```

### You can parse more than one type
*****
```
  widgetify = Widgetify::Base.new(url, {:format => 'json', :maxwidth => '150', :maxheight => '250', :provider => 'provider_name'}, :parse_oembed, :parse_open_graph)

  widgetify.parse_result
```

###### Provider Name List
*****

*   youtube
*   flickr
*   viddler
*   qik
*   revision3
*   hulu
*   vimeo
*   collegehumour
*   oohembed
*   polleverywhere
*   opera
*   embed
*   ifixit
*   smugmug
*   slideshare
*   wordpress
*   quickmeme