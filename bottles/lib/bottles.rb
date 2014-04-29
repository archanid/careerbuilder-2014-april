require 'forwardable'

class Bottles
  def song
    verses(99, 0)
  end

  def verses(first, last)
    first.downto(last).map {|i| verse(i)}.join("\n")
  end

  def verse(n)
    Verse.new(n).to_s
  end
end



class Verse
  extend Forwardable

  def_delegator :current_containers, :quantity, :current_quantity
  def_delegator :current_containers, :name,     :current_container_name

  def_delegator :remaining_containers, :quantity, :remaining_quantity
  def_delegator :remaining_containers, :name,     :remaining_container_name

  def_delegator :current_containers, :what_to_do, :old_what_to_do

  attr_reader :current_containers,
              :remaining_containers

  def initialize(n)
    @current_containers   = container_for(n)
    @remaining_containers = container_for(n-1)
  end

  def to_s
    "#{current_containers.quantity.capitalize} #{current_containers.name} of beer on the wall," + 
    " #{current_containers.quantity} #{current_containers.name} of beer.\n" + 
    "#{old_what_to_do}," + 
    " #{remaining_quantity} #{remaining_container_name} of beer on the wall.\n"
  end

  private

  def container_for(n)
    case n
    when -1
      Object.const_get("ContainerNeg1")
    else
      begin
        Object.const_get("Container#{n}")
      rescue
        Container
      end
    end.new(n)
  end
end



class Container
  attr_reader :n

  def initialize(n)
    @n = n
  end

  def quantity
    n.to_s
  end

  def name
    "bottles"
  end
  
  def what_to_do
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    "one"
  end
end



class Container6 < Container
  def name
    "six pack"
  end

  def quantity
    1.to_s
  end
end



class Container1 < Container
  def name
    "bottle"
  end

  def pronoun
    "it"
  end
end



class Container0 < Container
  def quantity
    "no more"
  end

  def what_to_do
    "Go to the store and buy some more"
  end
end



class ContainerNeg1 < Container
  def quantity
    99.to_s
  end
end

# first strategy: when 2 and else are the closest to each other, so it would require the smallest difference change. make two changes, first the 2/num, then the bottle/s

# next: collapse them now that they're identical, then propagate changes. collapsing has higher priority. keep going.

# at this point, the code is more complex than what we started with.

# now we can look at all the conditionals. do they look the same? yes.

# new requirement: now we want to add six packs of beer!

# what's wrong? we're not fully using single responsibility principle: all the private methods are more about n than about bottles. this suggests that n ought to be a class and the methods should be class methods for that object. that way this bottles class will be closer to SRP. use the extract class refactoring strategy.

# think about cohesion. Song relies only on verses. verses only relies on verse. verse relies on all the private ones below.

# Now extract class again.

# That worked. Now we can start to implement the new requirement.

# Make it open close to six pack by following SRP. Convert conditionals to polymorphism. Keep on doing SRP.

# Composition: Verse is composed of Variants
# Inheritance: Create Variant0
# Inheritance: Create Variant1