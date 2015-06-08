require_relative "checksplit.rb" 

=begin
Add a DinnerClub class. Each DinnerClub object represents a group of friends who go out to eat together frequently.

Dinner clubs should be able to list each member's name along with how much that person has paid during their def history  
endo f membership in the club. You will use the CheckSplitter class to calculate how much each member owes for each dinner
club event. Not every member goes to each event, so sometimes the check splitter is splitting a check between 4 people 
and sometimes it's 3 or 7 or 10 or you get the picture.
=end

class DinnerClub
  #members - Hash containing members.
  #member_names - go through and add attendees to hash and update
  def initialize(members_names)
    @members = Hash.new(0)
    @events = []
    members_names.each do |name|
      @members[name] = 0 
    end
  end
  
  #some go out to eat
  
  # cost - integer how much meal cost
  # tip_percent - integer how much tipped
  # attendees - array of members' names who went out'
  def visit_resturant(cost, tip_percent, people_paying)
    cs = CheckSplitter.new(cost, tip_percent, people_paying.length)
    
    amount_per_person = cs.each_pays
    people_paying.each do |a|
      @members [a] = @members[a] + amount_per_person
    end
    
    @members
  end
  
  def update_event(location, attendees_to_array)
    @events.push([location, attendees_to_array])
  end

end
