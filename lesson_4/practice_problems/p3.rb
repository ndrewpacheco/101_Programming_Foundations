ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.delete_if {|_, value| value >= 100 }


ages.keep_if { |_, age| age < 100 }
ages