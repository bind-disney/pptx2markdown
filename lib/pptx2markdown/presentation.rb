require 'nokogiri'

module Pptx2markdown
  class Presentation
    attr_reader :package, :metadata, :slides

    # some implementations may contain paths like "ppt/slides/slide.xml"
    # without slide number, therefore digits are not mandatory there
    SLIDE_PATH_RE = /\Appt\/slides\/slide(?<slide_number>\d*).xml\Z/.freeze

    def initialize(package)
      @package  = package
      @metadata = construct_metadata
      @slides   = construct_slides
    end

    def to_s
      slides.map(&:to_s).join "\n"
    end

    private

    def construct_metadata
      # because different versions of document schemas may have different
      # namespaces, we need to eliminate the namespace totally, since we
      # know that there are no ambiguities of extracted elements in this
      # document
      metadata = Nokogiri::XML(package.parts['docProps/app.xml'].content)
      metadata.remove_namespaces!
      metadata
    end

    def construct_slides
      slides = []
      titles = extract_slide_titles

      # additionally sort slides by an integer key
      # in order to match with corresponding slide titles
      extract_slides_data.sort.each_with_index do |slide_data, index|
        slide_xml = slide_data.last
        slide_title = titles[index]
        slides << Slide.new(slide_title, slide_xml)
      end

      slides
    end

    def extract_slide_titles
      # in order to drop used fonts and the current theme from the title list,
      # we need to slice list to the last <slides count> items only (that's a
      # little bit strange, of course, but as it is)
      titles = metadata.xpath '/Properties/TitlesOfParts/vector/lpstr/text()'
      titles.slice(-slides_count, titles.size).map &:text
    end

    def extract_slides_data
      # there are many more elegant ways to extract data in more functional
      # approach, but this one is the most simple and obvious, as for me
      slides = {}

      package.parts.each do |path, part|
        match = path.match SLIDE_PATH_RE
        next unless match

        index = match[:slide_number].to_i
        slides[index] = Nokogiri::XML(part.content)
      end

      slides
    end

    def slides_count
      metadata.at_xpath('/Properties/Slides').children.first.text.to_i
    end
  end
end
