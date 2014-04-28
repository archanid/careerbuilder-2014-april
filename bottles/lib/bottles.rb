class Bottles

  def verse(i)
    case i
    when 3..99
      "#{i} #{pluralize(i, container)} #{item_suffix} #{where}, #{i} #{pluralize(i, container)} #{item_suffix}.\nTake one down and pass it around, #{i-1} #{pluralize(i-1, container)} #{item_suffix} #{where}.\n"
    when 2
      "2 #{pluralize(i, container)} #{item_suffix} #{where}, 2 #{pluralize(i, container)} #{item_suffix}.\nTake one down and pass it around, 1 #{pluralize(i-1, container)} #{item_suffix} #{where}.\n"
    when 1
      "1 #{pluralize(i, container)} #{item_suffix} #{where}, 1 #{pluralize(i, container)} #{item_suffix}.\nTake it down and pass it around, no more #{pluralize(i-1, container)} #{item_suffix} #{where}.\n"
    else
      "No more #{pluralize(i, container)} #{item_suffix} #{where}, no more #{pluralize(i, container)} #{item_suffix}.\nGo to the store and buy some more, 99 #{pluralize(i-1, container)} #{item_suffix} #{where}.\n"
    end
  end

  def verses(s, e)
    s.downto(e).map {|i| verse(i)}.join("\n")
  end

  def song
    verses(99, 0)
  end

  def container
    "bottle"
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

  def pluralize(how_many, container)
    unless how_many == 1
      return container += "s"
    end
    container
  end
end