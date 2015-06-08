=begin
Build a CheckSplitter class.

New CheckSplitter objects should have an attribute that stores the total cost of the meal.
They should have a way to define the tip amount (and a value that's set by default).
They should be able to define how many people are in the group.
They should use that information to help determine how much each person owes.
=end
#create class
class CheckSplitter
  #identify accessors defining cost as read and write
  attr_accessor :cost, :tip_percent
  #creating blueprint
  #cost - input intiger to_f
  #people - intiger
  #tip percent - intiger
  def initialize (cost, tip_percent, people)
  @cost = cost
  @people = people
  @tip_percent = tip_percent
  end 
  #figures out tip amount  
  def tip_amount
    #if not formatted x.xx
    if tip_percent.to_f.round(2) >= 1
    (cost * tip_percent.to_f.round(2)/100).round(2)
    #if no tip entered user just hits enter
    elsif tip_percent == "" 
    (cost * 0.15).round(2)
    #if user enters 0
    elsif  tip_percent.to_f.round(2) == 0
    tip_amount = 0
    #setting default tip amount of 15%
    else
      (cost * tip_percent).round(2)    
    end
    
  end

# adds tip amount to the bill to find total_cost 
  def total_cost
    (tip_amount + cost).round(2)
  end
# figures out each person's payment if split evenly 
  def each_pays
    (total_cost / @people).round(2)
  end
end

=begin
user input gathering

puts "how much did the meal cost?"
cost = gets.to_f.round(2)
puts "number in your party?"
people = gets.to_i.round(2)
puts "tip percentage?"
tip_percent = gets.to_i.round(2)

check4 = CheckSplitter.new(cost, people, tip_percent)

puts "meal cost #{check4.cost}"
puts "Your Check tip amount #{check4.tip_amount}"
puts "Your total cost #{check4.total_cost}"
puts "each pays #{check4.each_pays}"
=end


