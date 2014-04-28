class Bottles

  def verse(i)
    case i
    when 3..99
      "#{i} bottles of beer on the wall, #{i} bottles of beer.
Take one down and pass it around, #{i-1} bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def verses(s, e)
    s.downto(e).map {|i| verse(i)}.join("\n")
  end

  def song
    verses(99, 0)
  end
end