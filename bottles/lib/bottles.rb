class Bottles

  def verse(i)
    "#{amount_starting(i).capitalize} #{pluralize(i, container)} #{item_suffix} #{where}, #{amount_starting(i)} #{pluralize(i, container)} #{item_suffix}.\n#{what_to_do(i)}, #{amount_ending(i)} #{pluralize(i-1, container)} #{item_suffix} #{where}.\n"
  end

  def verses(s, e)
    s.downto(e).map {|i| verse(i)}.join("\n")
  end

  def song
    verses(99, 0)
  end

  def amount_starting(i)
    if i == 0
      "no more"
    else
      "#{i}"
    end
  end

  def amount_ending(i)
    if i == 0
      99
    else
      amount_starting(i-1)
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

  def what_to_do(i)
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