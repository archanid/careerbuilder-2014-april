class Bottles

  def verse(i)
    case i
    when 3..99
      "#{i} bottles %s %s, #{i} bottles of beer.\nTake one down and pass it around, #{i-1} bottles of beer on the wall.\n" % [item_suffix, where]
    when 2
      "2 bottles %s %s, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n" % [item_suffix, where]
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def verses(s, e)
    s.downto(e).map {|i| verse(i)}.join("\n")
  end

  def song
    verses(99, 0)
  end

  def of_beer_on_the_wall
    "of beer on the wall"
  end


  def bottle_item
    "bottle"
  end

  def sixpack_item
    "six pack"
  end

  def item_suffix
    "of beer"
  end

  def beer_item(i)
    if i%6
      pluralize(i, bottle_item)
    else
      pluralize(i, sixpack_item)
    end
  end

  def where
    "on the wall"
  end

  def second_line_beg(i)
    "Take __ down and pass it around"
  end

  def second_line_end(i)
    beer_item(i-1) + " " + where
  end

  def pluralize(how_many, of_what)
    unless how_many == 1
      return of_what += "s"
    end
    of_what
  end
end