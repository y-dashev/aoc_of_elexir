defmodule DayTwo do
  def input do
    String.split(GetData.get_advent_by_day(2), "\n")
  end

  def parse do
    input()
      |> Enum.map(&(String.split(&1, " ")))
  end

  def items do
    parse()
      |> Enum.map()
  end
end
