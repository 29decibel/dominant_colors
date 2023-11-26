defmodule DominantColorsTest do
  use ExUnit.Case
  doctest DominantColors

  test "dominant_colors" do
    assert DominantColors.dominant_colors("./test/fixtures/test3.png") ==
             {:ok,
              [
                "#c0bdbc",
                "#2d2d2d",
                "#a19f9e",
                "#d8653a",
                "#eeedec",
                "#171616",
                "#716e6e",
                "#454242"
              ]}
  end

  test "dominant_colors with invalid file" do
    assert DominantColors.dominant_colors("./test/fixtures/test3.jp") ==
             {:error, "Can not open given file"}
  end
end
