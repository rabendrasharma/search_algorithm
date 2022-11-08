class Formatter
  def self.format_output(hash)
    hash.each{|k,v|print "\n#{k}:";v.first(5).each{|k,v|print " #{k}" if v !=0}}
  end
end
