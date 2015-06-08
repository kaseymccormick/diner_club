# Dinner Club explanation

## The assignment
First step of the assignment was to create a 'CheckSplitter' class that takes cost of the bill, tip percentage and number of attendees then split the cost evenly. Next was to create a 'DinnerClub' class that lists members of a dining club, and keep a running tally of how much they pay by using the check splitter class to figure out bill amounts. In addition not every member attends every event and an attendance list of each event and location had to be stored. Finally one person could cover the whole tab but attendance still needed to be taken for the whole group at every event.

## My solution summary
I chose to follow the reccomendation to have three seperate files an app.rb to handle the interface with the person inputting the data, dinner_club.rb with 'DinnerClub' class to hold the member and event information and, checksplit.rb with 'CheckSplitter' class to handle the math.
[Full code file *includes app.rb, dinner_club.rb, checksplit.rb*] (https://gist.github.com/kaseymccormick/9a4543f47fc60267ca08)

### class DinnerClub 
Does most of the work as it collects the members of the club and collects attendance lists for each event.

Attributes used
 - members â€” a hash originally empty that on the each loop enters name :key and balance :value, with a default value of 0
 - events â€” an array originally empty that later update_event behavior pushes to
```ruby
  def initialize(members_names)
    @members = {}
    @events = []
    members_names.each do |name|
      @members[name] = 0 
    end
```

Behaviors used
  - visit_resturant â€” state change
  - update_event â€” state change
  
**visit_resturant** 
Created to pass allong cost, tip_percent, and length of people_paying array from app.rb to checksplitter.rb for the 'CheckSplitter' class to figure out each_pays. Then goes through an each loop with each_pays amount to add it to the balance of all individuals in the people_paying array for that specific event. Paramaeters are cost, tip_percent, and people_paying gathered from app.rb. Lastly it returns the members list, but does not put it.

```ruby
  def visit_resturant(cost, tip_percent, people_paying)
    cs = CheckSplitter.new(cost, tip_percent, people_paying.length)
    
    
    people_paying.each do |a|
      @members [a] = @members[a] + cs.each_pays
    end
    
    @members
  end
```

**update_event** 
Created to gather the paramaeters location and attendees_to_array from app.rb and push that information to the @events array.
```ruby
  def update_event(location, attendees_to_array)
    @events.push([location, attendees_to_array])
  end
```

### class CheckSplitter
Is a helper class, it uses cost, people, and tip_percent to caculate how much each person would pay.

Attributes used
  - cost â€” intiger entered for what the bill is
  - people â€” intiger figured out by DinnerClub figuring out length of people_paying array.
  - tip_percent â€” intiger of amount they'd like to tip
  ```ruby
  def initialize (cost, tip_percent, people)
  @cost = cost
  @people = people
  @tip_percent = tip_percent
  end
  ```
  I accessor the cost and tip percent attributes for the following behaviors to work. I didn't need to make the people attribute read or write because the number is already figured out and modified ahead of time, no change will be done to it at this point and I just need CheckSplitter class to understand what @people is.  

Behaviors used
  - tip_amount â€” utility
  - total_cost â€” utility
  - each_pays â€” utility
  
  **tip_amount**
  Does the math of tip_percent (multiplied by) cost. I use if else statement to modify the tip percent to 0.00 format, put a default of 15% tip if not entered and allow the user to leave a 0% tip. I round to return values formatted like currency.
  ```ruby
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
  ```
  **total_cost**
  Takes the tip_amount and adds cost to it, I round to return values formatted like currency.
  ```ruby
  def total_cost
    (tip_amount + cost).round(2)
  end
  ```
  
  **each_pays**
  Uses total_cost divided by @people _determined by length of people_paying array created in DinnerClub class to figure out amount owed by each person paying.(See below snippet and visit_resturant snippet in DinningClub class for clarification.)
  ```ruby
  def each_pays
    (total_cost / @people).round(2)
  end
  ```