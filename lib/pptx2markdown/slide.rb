module Pptx2markdown
  class Slide
    attr_reader :title, :paragraphs

    def initialize(title, xml)
      @xml = xml
      @title = title
      @paragraphs = extract_paragraphs
    end

    def to_s
      "#{title}\n#{paragraphs_text}"
    end

    private

    def extract_paragraphs
      @xml.xpath('//a:t/text()').map(&:text).map(&:strip).select do |text|
        !text.empty? && text != title
      end
    end

    def paragraphs_text
      paragraphs.map { |paragraph| "\t#{paragraph}" }.join "\n"
    end
  end
end
