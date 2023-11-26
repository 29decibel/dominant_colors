defmodule DominantColorsTest do
  use ExUnit.Case
  doctest DominantColors

  test "dominant_colors" do
    assert DominantColors.dominant_colors("./test/fixtures/test3.png") == [
             "#bfbdbb",
             "#2f2e2e",
             "#a3a1a0",
             "#d8653a",
             "#eeedec",
             "#171515",
             "#7e7b7b",
             "#4d4b4b"
           ]
  end
end
