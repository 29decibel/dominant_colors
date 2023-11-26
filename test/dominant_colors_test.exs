defmodule DominantColorsTest do
  use ExUnit.Case
  doctest DominantColors

  test "add" do
    assert DominantColors.add(1, 2) == 3
  end
end
