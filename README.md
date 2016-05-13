### Description

This is the small ruby gem implemented as CLI app, which converts PowerPoint presentations to Markdown-like files.

It only supports 2-level lists where first level designates slide headers and second level (tab-indented) are the text paragraphs of the slide.

Also it can build simple text-only presentations from the 2-level lists described above and rebuild rich presentations to the text-only ones.

### Installation

1. Clone git repository
2. CD into it
3. Run ```docker build -t pptx2markdown .```

### Usage

Utility has 3 commands: dump, build and rebuild:

##### Dump content of the presentation to the STDOUT:

```
docker run --rm --name pptx2markdown -v $PWD:/data pptx2markdown dump -i /data/presentation.pptx
```

##### Dump content of the presentation to the file:

```
docker run --rm --name pptx2markdown -v $PWD:/data pptx2markdown dump -i /data/presentation.pptx -o /data/presentation.md
```

##### Build text-only presentation from the text file with 2-level lists:

```
docker run --rm --name pptx2markdown -v $PWD:/data pptx2markdown build -i /data/presentation.md -o /data/presentation.pptx
```

##### Rebuild rich presentation to text-only format:

```
docker run --rm --name pptx2markdown -v $PWD:/data pptx2markdown rebuild -i /data/presentation.pptx
```

### References

1. Creating Ruby gems
  * [Learn how RubyGems works, and how to make your own](http://guides.rubygems.org/)
2. Creating Command-line apps
  * [Ruby Gems for Command-Line Apps](http://www.awesomecommandlineapps.com/gems.html)
  * [33 Gems For Building Commandline Apps](http://blog.excelwithcode.com/build-commandline-apps.html)
  * [Writing command-line apps in Ruby](http://blog.honeybadger.io/writing-command-line-apps-in-ruby/)
  * [Writing Command Line Applications In Ruby With Thor](https://medium.com/@jatescher/writing-command-line-applications-in-ruby-with-thor-8df6bfcb4eb9#.lppl4asst)
  * [Building Unix-style command line applications](https://www.practicingruby.com/articles/building-unix-style-command-line-applications)
  * [How to Write Command-Line Applications in Ruby with GLI](http://blog.lunarlogic.io/2015/how-to-write-command-line-applications-in-ruby-with-gli/)
  * [The Rubyist's Guide to Environment Variables](http://blog.honeybadger.io/ruby-guide-environment-variables/)
  * [How to change the process name of your Ruby script as shown by `top` and `ps`](http://blog.honeybadger.io/how-to-change-the-process-name-in-ruby-for-top-and-ps/)
3. Parsing PowerPoint
  * [A PowerPont parser in Ruby](https://github.com/pythonicrubyist/ruby_powerpoint)
  * [Pure Ruby old PowerPoint file (.ppt) parser](https://github.com/ranguba/ppt-parser)
  * [RubyPoint](https://github.com/jpoz/rubypoint)
  * [Creates Powerpont presentation in Ruby](https://github.com/pythonicrubyist/powerpoint)
4. Converting to markdown
  * [Ruby Gem to convert Word documents to markdown](https://github.com/benbalter/word-to-markdown)
  * [Convert html code into markdown](http://github.com/xijo/reverse_markdown)
  * [Generate syntax-highlighted slides from Markdown](https://github.com/nakajima/slidedown)
  * [Writing In Markdown - Lists](http://www.macdrifter.com/2012/04/writing-in-markdown-lists.html)
5. Parsing and scraping HTML
  * [Веб-парсинг на Ruby](https://habrahabr.ru/post/252379/)
  * [Продвинутый парсинг веб-сайтов с Mechanize](https://habrahabr.ru/post/253439/)
  * [Использование morph.io для веб-парсинга](https://habrahabr.ru/post/262991/)
  * [Parsing HTML with Nokogiri](http://ruby.bastardsbook.com/chapters/html-parsing/)
  * [Writing a Web Crawler](http://ruby.bastardsbook.com/chapters/web-crawling/)
  * [An easy-to-use Ruby web spider framework](http://anemone.rubyforge.org/)
  * [A ruby library that makes automated web interaction easy](https://github.com/sparklemotion/mechanize)
  * [Typhoeus wraps libcurl in order to make fast and reliable requests](https://github.com/typhoeus/typhoeus)
  * [A Nokogiri interface to the Gumbo HTML5 parser](https://github.com/rubys/nokogumbo/)
  * [Ruby bindings for Google's Gumbo HTML5 parser](https://github.com/nevir/ruby-gumbo)
  * [An HTML5 parsing library in pure C99](https://github.com/google/gumbo-parser)
6. Working with XML and XPath
  * [XML Path Language (XPath) Version 1.0](https://www.w3.org/TR/xpath/)
  * [XPath Tutorial](http://www.w3schools.com/xsl/xpath_intro.asp)
  * [XPath in Five Paragraphs](http://www.rpbourret.com/xml/XPathIn5.htm)
  * [XPath в примерах](http://www.zvon.org/xxl/XPathTutorial/General_rus/examples.html)
  * [Nokogiri Tutorials](http://www.nokogiri.org/tutorials/)
  * [Getting Started with Nokogiri](https://blog.engineyard.com/2010/getting-started-with-nokogiri)
  * [Getting Started with Nokogiri and XML in Ruby](https://www.58bits.com/blog/2012/06/13/getting-started-nokogiri-xml-ruby)
7. Working with OpenXML
  * [Docsplit](https://documentcloud.github.io/docsplit/)
  * [Ruby html to word gem](https://github.com/karnov/htmltoword)
  * [A Ruby library to template Microsoft Word .docx files](https://github.com/jawspeak/ruby-docx-templater)
  * [Compose docx file (Microsoft Word 2007) based on a template XML](https://github.com/bagilevi/docx_builder)
  * [Caracal is a ruby library for dynamically creating professional-quality Microsoft Word documents (.docx)](https://github.com/trade-informatics/caracal/)
  * [Populating Word 2007 Templates Through Open XML](https://seroter.wordpress.com/2009/12/23/populating-word-2007-templates-through-open-xml/)
  * [Creating word documents in rails](http://rubythings.blogspot.ru/2011/05/creating-word-documents-in-rails.html)
  * [Use Ruby on Rails to modify an Open XML document](http://openxmldeveloper.org/blog/b/openxmldeveloper/archive/2009/07/02/5389.aspx)
8. Working with IO
  * [IO in Ruby](https://robots.thoughtbot.com/io-in-ruby)
  * [A self guided course on streams, files, file formats, and sockets](https://www.practicingruby.com/articles/study-guide-1)
  * [9.1 Streams](https://rubymonk.com/learning/books/1-ruby-primer/chapters/42-introduction-to-i-o/lessons/89-streams)
  * [Input & output in Ruby](http://zetcode.com/lang/rubytutorial/io/)
