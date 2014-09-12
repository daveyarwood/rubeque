# Make a module inherit from another. This is a little bit trickier than it looks. 

module ChildModule
  def self.included(base)
    base.send :include, ParentModule
  end
end

module ParentModule
  def parent_module_method
    'This should get called'
  end
end

# tests

class TestClass
  include ChildModule
end

assert_equal TestClass.new.parent_module_method, 'This should get called'
