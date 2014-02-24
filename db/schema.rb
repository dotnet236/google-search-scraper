ActiveRecord::Schema.define(:version => 20140224145749) do
  create_table 'queries', :force => true do |t|
    t.string 'term'
  end

  create_table 'ads', :force => true do |t|
    t.integer 'index'
    t.string  'content'
    t.string 'link'
    t.string 'description'
    t.integer 'query_id', references: 'queries'
  end
end
