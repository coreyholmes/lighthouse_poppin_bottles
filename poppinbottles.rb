# For every two empty bottles, you can get one free (full) bottle of pop
# For every four bottle caps, you can get one free (full) bottle of pop
# Each bottle of pop costs $2 to purchase

class Person

DIVIDER = "-" * 35
  def initialize(name)
    @name = name
    @wallet = rand(20..100)
    @bottle_price = 2
    @bottles = 0
    @bottle_caps = 0
  end

  def accountReview
    print "\n\n\n"
    puts DIVIDER
    puts "Account Review"
    puts DIVIDER
    puts "Name: #{@name}\nID: #{@name.object_id}"
    puts DIVIDER
    puts "Cash".ljust(10) + "$#{@wallet}".rjust(25)
    puts "Bottles".ljust(10) + "#{@bottles}".rjust(25)
    puts "Caps".ljust(10) + "#{@bottle_caps}".rjust(25)
    puts DIVIDER
    print "\n\n\n"
  end

   def buy
    print "\n\n\n"
    puts DIVIDER
    puts "#{@name}! Welcome to the Bottle Shop!"
    puts DIVIDER

    continue = true
    while continue do
      print "What would you like to do? [buy] [recycle] [leave]: "
      
      puts case gets.chomp.downcase
        when "buy"
          puts "You have $#{@wallet}"
          puts "Bottles cost $#{@bottle_price}"
          print "Quantity: "
          bottle_quantity = gets.chomp.to_i
          if bottle_quantity * @bottle_price > @wallet
            puts "Sorry you don't have enough money!"
            return buy
          else
            @wallet -= bottle_quantity * @bottle_price
            @bottles +=  bottle_quantity
            @bottle_caps += bottle_quantity
            puts DIVIDER
            puts "Thanks! You just purchased #{bottle_quantity} bottle(s)."
            puts "You have $#{@wallet} left in your wallet."
            puts DIVIDER
            print "\n\n\n"
            return options
          end
        
        when "recycle"
          print "What do you want to recycle [bottles] [caps] [nothing]: " 
          item = gets.chomp

          if item == "caps"
              if @bottle_caps >= 4
                puts DIVIDER
                puts "You have #{@bottle_caps} bottle caps."
                puts "You can recycle 4 caps in exchange for 1 bottle."
                puts "You're eligable for #{(@bottle_caps / 4)} bottle(s)."
                print "How many bottles do you want: "
                cap_recycle = gets.chomp.to_i
                  if (@bottle_caps / 4) >= cap_recycle
                    puts DIVIDER 
                    @bottle_caps -= cap_recycle * 4
                    @bottles += cap_recycle
                    @bottle_caps += cap_recycle
                    puts "Thanks for recycling!"
                    puts "You recycled #{cap_recycle * 4} caps in exchange for #{cap_recycle} bottles."
                  else
                    puts DIVIDER
                    puts "Sorry, you're eligable for #{(@bottle_caps / 4)} bottles, not #{cap_recycle}!"
                    return buy
                  end
              else
                puts DIVIDER
                puts "Sorry you need at least 4 bottle caps to recyle. You have #{@bottle_caps} cap(s)."
                print "\n\n\n"
                return options
              end   

          elsif item == "bottles"
              if @bottles >= 2
                puts DIVIDER
                puts "You have #{@bottles} empty bottle(s)."
                puts "You can recycle 2 empty bottles in exchange for 1 full Bottle."
                puts "You're eligable for #{(@bottles / 2)} full bottles."
                print "How many bottles do you want: "
                bottle_recycle = gets.chomp.to_i
                  if (@bottles / 2) >= bottle_recycle
                    puts DIVIDER
                    @bottles -= bottle_recycle * 2
                    @bottles += bottle_recycle
                    @bottle_caps += bottle_recycle
                    puts "Thanks for recycling!"
                    puts "You recycled #{bottle_recycle * 2} empty bottles in exchange for #{bottle_recycle} full bottles."
                  else
                    puts DIVIDER
                    puts "Sorry, you're eligable for #{(@bottles / 2)} bottles, not #{bottle_recycle}!"
                    return buy
                  end
              else
                puts DIVIDER
                puts "Sorry you need at least 4 bottle caps to recyle. You have #{@bottles} bottles(s)."
                print "\n\n\n"
                return options
              end

          elsif item == "nothing"
            print "\n\n\n"
            return buy

          else
            print "\n\n\n"
            return buy
          end

          when "leave"
            puts DIVIDER
            puts "Thanks for visiting #{@name}!"
            print "\n\n\n"
            return options
        end # Case statement
      end # While loop
    end  # Def buy

    # choice = gets.chomp.downcase
    # puts "Bottles".ljust(10) + "#{@bottles}".rjust(25)
    # puts "Caps".ljust(10) + "#{@bottle_caps}".rjust(25)
    # puts DIVIDER
    # print "\n\n\n"

    # print "What do you want to buy: " 
    # item = gets.chomp
    # print "Quanity: " 
    # quantity = gets.chomp

  def options
    continue = true
    while continue do
      puts "What do you want to do? [review] [shop] [quit]"
      puts case gets.chomp
      when "review"
        print accountReview
      when "shop"
        return buy
      when "quit"
        puts "See ya #{@name}!"
        break
      else
        "I didn't understand."
      end  
    end
  end

  def game
    puts "Hey #{@name}, Let's pop some bottles!"
    puts "You need some money..."
    puts DIVIDER
    print "[Press Enter]"
    enter = gets 
    if enter == "\n"
      puts "WooHoo! Here's $#{@wallet}!"
    end
    return options
  end
end

Person.new("Corey").game
