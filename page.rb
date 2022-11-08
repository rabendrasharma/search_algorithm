require_relative './strength_rating'

class Page
  @@page_number = 0
  @@page_keywords = {}

  def initialize(keywords=[])
    @@page_number += 1
    page_index = PAGE+(@@page_number).to_s
    @@page_keywords[page_index] = keywords
  end

  def self.all
    @@page_keywords
  end

  def self.number
    @@page_number
  end

  def self.get_web_page_having(query_key, query_value)
    result = {}
    matched_pages = {}

    Page.all.each do |key, page|
      strength_rating = 0
      query_value.each do |query_value|
        strength_rating += StrengthRating.calculate(page.index(query_value), query_value.index(query_value)) if(page.include? query_value)
      end
      matched_pages[key] = strength_rating
      result[query_key] = matched_pages.sort_by{|k,v| -v}
    end
    result
  end
end
