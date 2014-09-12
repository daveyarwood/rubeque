#  One of our favorite methods in Ruby 1.9 is each_with_object. It works much like inject. 
# Use each_with_object to return an array containing one reversed string for each string 
# that has an even number of characters. 

def even_sum(arr)
  arr.each_with_object([]) do |w, a| 
    a << w.reverse if w && (w.length % 2 == 0)
  end
end

# tests
assert_equal even_sum(["cat", "dog", "bird", "fish"]), ["drib", "hsif"]
assert_equal even_sum(["why", "chunky", nil, "lucky", "stiff"]), ["yknuhc"]
assert_equal even_sum(["rewsna", "hitch hiker", "si", "guide", "galaxies ", "24"]), ["answer", "is", "42"]
