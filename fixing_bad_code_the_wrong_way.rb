#  Your coworker did a bad job defining a class. Fix it for him using #method_missing. 

class Person
  def initialize(name, age, incoming_race)
    @name = name
    @age = age
    self.race = incoming_race
  end

  def nam
    @name.split.map(&:capitalize).join(" ")
  end

  def agE
    @age
  end

  def method_missing(m, *args)  # code goes here
    if m == :name
      nam
    elsif m == :age
      agE
    elsif m == :race=
      @race = args[0]
    elsif m == :race
      @race.split.map(&:capitalize).join(" ")
    else
      super
    end
  end
end

# tests
person = Person.new("kurt vonnegut", 89, "caucasian")

assert_equal person.name, "Kurt Vonnegut"
assert_equal person.race, "Caucasian"
assert_equal person.age, 89
