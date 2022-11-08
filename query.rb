class Query
  @@query_number = 0
  @@query_keywords = {}

  def initialize(keywords=[])
    @@query_number +=1
    query_index = QUERY+(@@query_number).to_s
    @@query_keywords[query_index] = keywords
  end

  def self.all
    @@query_keywords
  end
end
