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



  @word_mapping %{
    "zero" => "0",
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }

  @moduledoc """
    Parse string as digits
  """
  def parse_letter_digits do
    String.split(input(), "\n")
      |> Enum.reject(&(&1 == ""))
      |> Enum.map(fn n ->
        # Convert each word to a number or keep it as is
      end)
  end

  def part2 do
    parse_letter_digits()
    |> IO.puts()
  end

  defp convert_word(word) do
    case Map.get(@word_mapping, String.downcase(word)) do
      value -> value
    end
  end
end
