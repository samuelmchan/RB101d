# Your team is asked to refactor some legacy code used by the marketing team.
# One of the requirements of the project is to change the implementation
# from using basic looping structures to using iterative methods instead.



mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  full_name = mailing_campaign_leads[counter][:name] # 'Emma Lopez'
  names = full_name.split # ['Emma', 'Lopez']

  names_counter = 0
  loop do
    break if names_counter == names.size
    name = names[names_counter] # 'Emma'
    names[names_counter] = name.capitalize # 'Emma'

    names_counter += 1
  end

  capitalized_full_name = names.join(' ') # 'Emma Lopez'
  mailing_campaign_leads[counter][:name] = capitalized_full_name # 'Emma Lopez'

  counter += 1
end

usable_leads = []
counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login]
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter]
  end

  counter += 1
end

# mailing_campaingn_leads => [
#   {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
#   {name: 'Mike Richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
#   {name: 'Jane Williams', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
#   {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
# ]

# usable_leads => [
#   {name: 'Jane Williams', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
#   {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
# ]

# A (incorrect)
mailing_campaign_leads.map do |lead|
  lead[:name].capitalize! # String#capitalize! is destructive!
end

# => ['Emma lopez', 'Mike richards', 'Jane williams', 'Ash patel']


mailing_campaign_leads.select! do |lead|
  lead[:days_since_login] < 60 && lead[:mailing_list]
end

# => usable_leads => [
#   {name: 'Jane Williams', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
#   {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
# ]

# B (incorrect)

mailing_campaign_leads.each do |lead|
  names = lead[:name].split # ['Emma', 'Lopez']
  names.map! { |name| name.capitalize } # ['Emma', 'Lopez']
  lead[:name] = names.join(' ') # 'Emma Lopez'
end

usable_leads = mailing_campaign_leads.keep_if do |lead|
  lead[:days_since_login] <= 60 && lead[:mailing_list] # <= needs to be <
end

# C (correct)

mailing_campaign_leads.each do |lead|
  names = lead[:name].split # ['Emma', 'Lopez']
  lead[:name] = names.map { |name| name.capitalize }.join(' ')
end

usable_leads = mailing_campaign_leads.reject do |lead|
  last_login = lead[:days_since_login]
  subscribed_to_list = lead[:mailing_list]
  last_login > 59 && !subscribed_to_list
end

# D (correct)

mailing_campaign_leads.each do |lead|
  names = lead[:name].split
  names.map! { |name| name.capitalize }
  lead[:name] = names.join(' ')
end

usable_leads = mailing_campaign_leads.select do |lead|
  lead[:days_since_login] < 60 && lead[:mailing_list]
end
