require 'forwardable'

class Bottles
  def song
    verses(99, 0)
  end

  def verses(first, last)
    first.downto(last).map {|i| verse(i)}.join("\n")
  end

  def verse(n)
    Verse.new(kindofvariant(n)).to_s
  end

  private

  def kindofvariant(n)
    begin
      Object.const_get("Variant#{n}")
    rescue
      Variant
    end.new(n)
  end
end

class Verse
  extend Forwardable
  def_delegators :@variant, :current_quantity,
                            :current_container_name,
                            :remaining_quantity,
                            :remaining_container_name,
                            :what_to_do

  attr_reader :variant

  def initialize(variant)
    @variant = variant
  end

  def to_s
    "#{current_quantity.capitalize} #{current_container_name} of beer on the wall," + 
    " #{current_quantity} #{current_container_name} of beer.\n" + 
    "#{what_to_do}," + 
    " #{remaining_quantity} #{remaining_container_name} of beer on the wall.\n"
  end
end

class Variant
  extend Forwardable
  def_delegators :@current_containers, :current_quantity,
                                       :current_container_name
  def_delegators :@remaining_containers, :remaining_quantity,
                                         :remaining_container_name

  attr_reader :n, 
              :current_containers, 
              :remaining_containers

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

  def initialize(n)
    @n                    = n
    @current_containers   = container_for(n)
    @remaining_containers = container_for(n-1)
  end

  def what_to_do
    "Take #{noun} down and pass it around"
  end

  def noun
    "one"
  end

  def current_quantity
    current_containers.quantity
  end

  def remaining_quantity
    remaining_containers.quantity
  end

  def current_container_name
    current_containers.name
  end

  def remaining_container_name
    remaining_containers.name
  end
end

class Variant0 < Variant
  def what_to_do
    "Go to the store and buy some more"
  end
end

class Variant1 < Variant
  def noun
    "it"
  end
end

class Variant2 < Variant
  def remaining_container_name
    "bottle"
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
end

class Container1 < Container
  def name
    "bottle"
  end
end

class Container0 < Container
  def quantity
    "no more"
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