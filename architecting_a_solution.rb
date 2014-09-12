# Use a Struct to define an Architect class. 

Architect = Struct.new(:name, :works)

# tests
flr = Architect.new("frank loyd wright")
imp = Architect.new("I. M. Pei", ["new college dorms", "jfk library"])

flr.works = ["Guggenheim", "fallingwater"]

assert_equal flr.name, "frank loyd wright"
assert_equal imp.works, ["new college dorms", "jfk library"]
