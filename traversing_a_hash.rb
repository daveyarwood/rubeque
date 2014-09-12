# Write a method #r_empty? that returns true if a hash and its subhashes are 
# empty or false if there is a value in the hash. 

class Hash
  def r_empty?
    values.all? {|v| v.is_a?(Hash) ? v.r_empty? : (v.nil? || v.empty?)}
  end
end

# tests
a = {:ruby => "", :queue => ""}
b = {:ruby => {:version => {:one => {"nine" => ""}, "two" => "=^.^="}}, :html => ""}
c = {:pets => {:dogs => {:my => {"niko" => ""}, "ollie" => ""}}, :cats => nil, :mice => ""}
d = {a: "", b: :two, c: ""}

assert_equal a.r_empty?, true
assert_equal b.r_empty?, false
assert_equal c.r_empty?, true
assert_equal d.r_empty?, false
assert_equal ({}.r_empty?), true


