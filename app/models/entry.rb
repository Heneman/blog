class Entry < ActiveRecord::Base
  include FriendlyId
  require 'redcarpet'

  before_save :get_html
  belongs_to :user
  validates_presence_of :title, :tag_list, :markdown, :slug
  delegate  :title?, :category?, :markdown?, :to => :user
  attr_accessible :title, :category, :tag_list, :markdown, :created_at, :updated_at, :slug

  # acts-as-taggable-on
  acts_as_taggable
  acts_as_taggable_on :tags

  # FriendlyID
  friendly_id :title, :use => :slugged
  
  def get_html
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

    self.html = SyntaxHighlighter.new(markdown.render(self.markdown)).hightlight_html
  end
end

class SyntaxHighlighter
  require 'net/http'
  require 'uri'
  require 'nokogiri'

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
    out = Nokogiri::HTML.fragment(doc.to_s)
    out.to_html
  end
end