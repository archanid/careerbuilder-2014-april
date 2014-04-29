class Bottles
  def song
    verses(99, 0)
  end

  def verses(start, the_end)
    start.downto(the_end).map {|i| verse(i)}.join("\n")
  end

  def verse(num)
    case num
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "#{num} #{ewer(num)} of beer on the wall, #{num} #{ewer(num)} of beer.\nTake #{noun(num)} down and pass it around, no more bottles of beer on the wall.\n"
    else
      "#{num} #{ewer(num)} of beer on the wall, #{num} #{ewer(num)} of beer.\nTake #{noun(num)} down and pass it around, #{num-1} #{ewer(num-1)} of beer on the wall.\n"
    end
  end
end

def quantity(n)
  if n == 
    "no more"
  else
    n.to_s
  end
end

def noun(n)
  if n == 1
    "it"
  else
    "one"
  end
end

def ewer(n)
  if n == 1
    "bottle"
  else
    "bottles"
  end
end

# first strategy: when 2 and else are the closest to each other, so it would require the smallest difference change. make two changes, first the 2/num, then the bottle/s

# next: collapse them now that they're identical, then propagate changes. collapsing has higher priority. keep going.