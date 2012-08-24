atom_feed do |feed|
  feed.title("Kyle Heneman")
  feed.updated(@entries[0].created_at) if @entries.length > 0

  @entries.each do |entry|
    feed.entry(entry) do |e|
      e.title(entry.title)
      e.content(excerpt entry, :type => 'html')

      e.author do |author|
        author.name("Kyle Heneman")
      end
    end
  end
end 