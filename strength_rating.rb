module StrengthRating
  @max_value = 8
  def self.calculate(page_index, query_index)
    return (@max_value - page_index ) * (@max_value - query_index)
  end
end
