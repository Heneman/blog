class Entry < ActiveRecord::Base
  before_save :render_html
  belongs_to :user
  validates_presence_of :title, :tag_list, :markdown
  delegate  :title?, :category?, :markdown?, :to => :user
  attr_accessible :title, :category, :tag_list, :markdown, :created_at, :updated_at

  # acts-as-taggable-on
  acts_as_taggable
  acts_as_taggable_on :tags
  
  def render_html
    return if self.markdown.blank?

    renderer = Redcarpet::Render::HTML.new(
                :with_toc_data => true,
                :xhtml => true)

    extensions = {:no_intra_emphasis => true,
                  :fenced_code_blocks => true,
                  :autolink => true,
                  :strikethrough => true,
                  :space_after_headers => true,
                  :superscript => true}

    markdown = Redcarpet::Markdown.new(renderer, extensions)

    self.html = Redcarpet::Render::SmartyPants.render(SyntaxHighlighter.new(markdown.render(self.markdown)).hightlight_html)
  end
end

require 'net/http'
require 'uri'

class SyntaxHighlighter
  PYGMENTS_URI = 'http://pygments.appspot.com/'

  def initialize(html)
    @html = html
  end

  def hightlight_html
    doc = Nokogiri::HTML(@html)
    doc.search('pre > code[class]').each do |code|
      request = Net::HTTP.post_form(URI.parse(PYGMENTS_URI),
                  {'lang' => code[:class],
                   'code' => code.text.rstrip})
      
      code.parent.replace request.body
    end
    doc.to_s
  end
end