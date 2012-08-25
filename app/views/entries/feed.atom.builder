atom_feed :language => 'en-US' do |feed|
  feed.title  "Kyle Heneman"
  feed.updated(@entries[0].updated_at) if @entries.length > 0
   
  @entries.each do |entry|
    next if entry.updated_at.blank?
     
    feed.entry(entry) do |e|
      entry.url entry_path(e)
      entry.title e.name
      entry.content excerpt(e.html), :type => 'html'
      entry.updated(e.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
     
      entry.author do |author|
        author.name("Kyle Heneman")
      end
    end
  end
end