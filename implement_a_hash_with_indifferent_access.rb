# Implement a hash class which does not distinguish between symbols and 
# strings for its keys. 

class HashWithIndifferentAccess
  def initialize(hash={})
    @contents = Hash.new
    hash.each {|k,v| self[k] = v}
  end
  
  def []=(k,v)
    @contents[k.to_sym] = v
  end
  
  def [](k)
    @contents[k.to_sym]
  end
  
  def self.[](*arr)
    self.new(Hash[*arr])
  end
end

# tests
composers = HashWithIndifferentAccess.new
composers[:Janacek] = "Leos Janacek"
composers["Sweelinck"] = "Jan Pieterszoon Sweelinck"

mathematicians = HashWithIndifferentAccess["Yutaka", "Taniyama", :Alonzo, "Church"]

assert_equal composers["Janacek"], "Leos Janacek"
assert_equal composers[:Sweelinck], "Jan Pieterszoon Sweelinck"
assert_equal mathematicians[:Yutaka], "Taniyama"
assert_equal (mathematicians["Alonzo"] == mathematicians[:Alonzo]), true


