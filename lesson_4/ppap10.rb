munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |munster, profile|
  if profile["age"].between?(0, 17)
    profile.store("age_group", "kid")
  elsif profile["age"].between?(18, 64)
    profile.store("age_group", "adult")
  elsif profile["age"] > 64
    profile.store("age_group", "senior")
  else
    puts "invalid age"
  end
end

p munsters
