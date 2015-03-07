# I heard you like Lisp so I put some S-expressions in your Ruby. Take these 
# S-expressions and evaluate them as if they were Ruby code. For more 
# information about S-expressions, visit http://en.wikipedia.org/wiki/S-expression.

class Fixnum
  alias_method :plus, :+
  def +(*others)
    ([self] + others).inject {|sum, x| sum.plus(x)}
  end

  alias_method :minus, :-
  def -(*others)
    ([self] + others).inject {|diff, x| diff.minus(x)}
  end
end

def sexp_eval(sexp)
  return sexp unless sexp.is_a? Array
  return sexp.map {|x| sexp_eval x} unless [Symbol, Proc].include? sexp.first.class
  fn, *args = *sexp
  args = sexp_eval args  
  fn.to_proc.call(*args)
end

# tests
sexp1 = [:flatten, [1, 2, [:to_a, (4..6)], [:-, 8, 4]]]
sexp2 = [:==, [:*, 2, 3], [:remainder, 13, 7]]
sexp3 = [(-> x, y {Math.sqrt(x**2 + y**2)}), [:-, 9, 3, 3], [:+, 1, 1, 1, 1]]

assert_equal sexp_eval(sexp1), [1, 2, 4, 5, 6, 4]
assert_equal sexp_eval(sexp2), true
assert_equal sexp_eval(sexp3), 5.0