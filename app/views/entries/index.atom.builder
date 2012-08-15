atom_feed do |feed|
  feed.title ="Kyle Heneman"
  feed.updated_at @entries.first.updated_at

  @entries.each do |entry|
    feed.entry(entry) do |e|
      e.title = entry.title
      e.content entry.html, :type => "html"
    end
  end
end