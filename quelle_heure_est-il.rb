# Write a function to parse some dates and return a standard format. 
# Hint: the help page might be of use. 

# Apparently can't require "date". Hmm, onto Plan B...

def pretty_date(date)
  format = case date
  when /\d{1,2}-\d{1,2}-\d{4}/
    :one
  when /[a-zA-Z]+ \d{1,2}, \d{4}/
    :two
  when /\d{4}-\d{1,2}-\d{1,2}/
    :three
  when /\d{1,2}\/\d{1,2}\/\d{4}/
    :four
  end
  
  elements = date.split(/, |[- \/]/).reject{|s| s.empty?}
  
  year = case format
  when :one, :two, :four
    elements[2]
  when :three
    elements[0]
  end
  
  number_to_abbrev = { 1 => "Jan", 2 => "Feb", 3 => "Mar", 4 => "Apr",
                       5 => "May", 6 => "Jun", 7 => "Jul", 8 => "Aug",
                       9 => "Sep", 10 => "Oct", 11 => "Nov", 12 => "Dec" }
  
  month = case format
  when :one, :four
    number_to_abbrev[elements[0].to_i]
  when :two
    elements[0][0,3]
  when :three
    number_to_abbrev[elements[1].to_i]
  end
  
  day = case format
  when :one, :two, :four
    elements[1]
  when :three
    elements[2]
  end
  
  "#{month} #{day}, #{year}"
end

# tests
assert_equal pretty_date("11-30-1835"), "Nov 30, 1835"
assert_equal pretty_date("July 20, 1933"), "Jul 20, 1933"
assert_equal pretty_date("1922-11-11"), "Nov 11, 1922"
assert_equal pretty_date("9/20/1978"), "Sep 20, 1978"
