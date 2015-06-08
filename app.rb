require_relative "dinner_club.rb"
#collecting club members
puts "Who is in the dinner club? (Comma-sperated)"
people = gets.chomp
#creating dinnerclub with those members
dc = DinnerClub.new(people.split(", "))

puts "Want to enter a dinner event?"
#verifying they want to enter information
action =gets.chomp
#basking cost, attendance and tip_percentage until user says no
while action != "no" do
  #gathering where they went
  puts "Where did you go?"
  location = gets.chomp
 
  #getting cost of meal
  puts "Meal cost:"
  cost = gets.chomp.to_i
  
  #getting tip percentage
  puts "Tip percentage:"
  tip_percent = gets.chomp.to_i
  
  #gathering who's in attendance
  puts "Who attennded?"
  attendees = gets.chomp.capitalize
  
  #puts who attended into an array
  attendees_to_array = attendees.split(", ")
  
  #gathering who's paying
  puts "Who is paying?"
  payers = gets.chomp
  
  #puts who attended into an array
  people_paying_to_array = payers.split(", ")
  
  #shows updated running ballance # parameters are cost,tip...
  puts dc.visit_resturant(cost, tip_percent, people_paying_to_array)
  
  #shows people at specific events
  puts dc.update_event(location, attendees_to_array)
  
  #gives user an exit
  puts "Add another event?"
  action = gets.chomp
end

