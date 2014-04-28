class Bottles

  def verse(i)
    case i
    when 3..99
      "#{i} #{containers} %s %s, #{i} bottles %s.\nTake one down and pass it around, #{i-1} bottles %s %s.\n" % [item_suffix, where, item_suffix, item_suffix, where]
    when 2
      "2 bottles %s %s, 2 bottles %s.\nTake one down and pass it around, 1 bottle %s %s.\n" % [item_suffix, where, item_suffix, item_suffix, where]
    when 1
      "1 bottle %s %s, 1 bottle %s.\nTake it down and pass it around, no more bottles %s %s.\n" % [item_suffix, where, item_suffix, item_suffix, where]
    else
      "No more bottles %s %s, no more bottles %s.\nGo to the store and buy some more, 99 bottles %s %s.\n" % [item_suffix, where, item_suffix, item_suffix, where]
    end
  end

  def verses(s, e)
    s.downto(e).map {|i| verse(i)}.join("\n")
  end

  def song
    verses(99, 0)
  end

  def containers
    "bottles"
  end

  def item_suffix
    "of beer"
  end

  def where
    "on the wall"
  end

  def second_line_beg(i)
    "Take one down and pass it around"
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