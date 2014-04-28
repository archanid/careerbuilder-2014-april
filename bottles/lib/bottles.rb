class Bottles

  def verse(i)
    case i
    when 1..99
      "#{amount_starting(i)} #{pluralize(i, container)} #{item_suffix} #{where}, #{i} #{pluralize(i, container)} #{item_suffix}.\n#{second_line_beg(i)}, #{amount_ending(i)} #{pluralize(i-1, container)} #{item_suffix} #{where}.\n"
    else
      "#{amount_starting(i)} #{pluralize(i, container)} #{item_suffix} #{where}, no more #{pluralize(i, container)} #{item_suffix}.\n#{second_line_beg(i)}, #{amount_ending(i)} #{pluralize(i-1, container)} #{item_suffix} #{where}.\n"
    end
  end

  def verses(s, e)
    s.downto(e).map {|i| verse(i)}.join("\n")
  end

  def song
    verses(99, 0)
  end

  def amount_starting(i)
    if i == 0
      "No more"
    else
      "#{i}"
    end
  end

  def amount_ending(i)
    if i == 1
      "no more"
    elsif i == 0
      99
    else
      "#{i-1}"
    end
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
    if i == 0
      "Go to the store and buy some more"
    elsif i == 1
      "Take it down and pass it around"
    else
      "Take one down and pass it around"
    end
  end

  def pluralize(how_many, container)
    unless how_many == 1
      return container += "s"
    end
    container
  end
end