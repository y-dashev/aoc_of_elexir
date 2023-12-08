defmodule AdventOfElexirTest do
  use ExUnit.Case
  doctest AdventOfElexir

  test "greets the world" do
    assert AdventOfElexir.hello() == :world
  end
end
