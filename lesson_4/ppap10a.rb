munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def age_group(age)
  case
  when age.between?(0, 17) then "kid"
  when age.between?(18, 64) then "adult"
  when age > 64 then "senior"
  end
end

munsters.each do |munster, profile|
  profile.store("age_group", age_group(profile["age"]))
end

p munsters
