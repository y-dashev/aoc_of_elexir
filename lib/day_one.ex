defmodule DayOne do
  @moduledoc """
    Get data from adventofcode
  """
  def input do
    GetData.get_advent_by_day(1)
  end

  @moduledoc """
    Set data to array only of integers
  """
  def input_to_array do
    String.split(input(), "\n")
    |> Enum.map(&String.replace(&1, ~r/[^0-9]/, ""))
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&String.to_integer/1)
  end

  @moduledoc """
    Sum values of cleaned array
  """
  def sum_values do
    input_to_array()
      |> Enum.map(fn n ->
        if length(Integer.digits(n)) == 1 do
          n * 10 + n
        else
          String.to_integer("#{String.at(Integer.to_string(n), 0)}#{String.at(Integer.to_string(n), -1)}")
        end
      end)
      |> Enum.sum()
  end

end
