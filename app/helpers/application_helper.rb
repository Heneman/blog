module ApplicationHelper
  def excerpt e
    before, after = e.html.split('<!--more-->')
    before
  end
end