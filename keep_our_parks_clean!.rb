# Can you change a method name in a class without littering your class with 
# unused methods? 

class  BasePark
  def self.clean_alias_method(new_name,old_name)
    define_method new_name, instance_method(old_name)
    remove_method old_name
  end
end

class Park < BasePark
  def bad_method_name
    "This should have a better name"
  end
  
  clean_alias_method(:good_method_name,:bad_method_name)
end

# tests
assert_equal(Park.new.good_method_name, "This should have a better name")
assert_equal(Park.new.respond_to?(:bad_method_name),false)
