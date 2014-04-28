class BeerSongDictionary
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
    unless how_many == 1 do
      return of_what += "s"
    end
    of_what
  end
end