defmodule DominantColorsTest do
  use ExUnit.Case
  doctest DominantColors

  test "dominant_colors" do
    assert DominantColors.dominant_colors("./test/fixtures/test3.png") ==
             {:ok,
              [
                "#171616",
                "#2d2d2d",
                "#454242",
                "#716e6e",
                "#d8653a",
                "#a19f9e",
                "#c0bdbc",
                "#eeedec"
              ]}
  end

  test "dominant_colors with invalid file" do
    assert DominantColors.dominant_colors("./test/fixtures/test3.jp") ==
             {:error, "Can not open given file"}
  end
end
