defmodule DayOne do
  @digits %{
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
  }
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


  def day2 do
    solve(input())
  end

  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&convert_line/1)
    |> Enum.sum()
  end

  def convert_line(line) do
    10 * first_digit(line) + last_digit(String.reverse(line))
  end

  for digit <- 1..9 do
    string = Integer.to_string(digit)
    defp first_digit(<<unquote(string), _::binary>>), do: unquote(digit)
    defp last_digit(<<unquote(string), _::binary>>), do: unquote(digit)
  end

  for {string, digit} <- @digits do
    reverse_string = String.reverse(string)
    defp first_digit(<<unquote(string), _::binary>>), do: unquote(digit)
    defp last_digit(<<unquote(reverse_string), _::binary>>), do: unquote(digit)
  end

  defp first_digit(<<_::utf8, rest::binary>>), do: first_digit(rest)
  defp last_digit(<<_::utf8, rest::binary>>), do: last_digit(rest)
end
