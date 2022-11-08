require_relative './page'
require_relative './query'
require_relative './formatter'
require_relative './web_page_keyword_type'


def process_input(string_line)
  keywords = string_line.split(" ")
  type_of_keyword = keywords.delete_at(0)

  Page.new(keywords) if type_of_keyword == PAGE
  Query.new(keywords) if type_of_keyword == QUERY
end

def read_input_from_file
  file_path = File.join(File.dirname(__FILE__), 'input.txt')
  File.open(file_path, "r") do |f|
    f.each_line do |line|
      process_input(line)
    end
  end
end

def search_query_in_web_page
  Query.all.each do |query_number,query_keyword|
    result  = Page.get_web_page_having(query_number, query_keyword)
    Formatter.format_output(result)
  end
end

read_input_from_file
search_query_in_web_page
