defmodule DominantColors do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :dominant_colors,
    crate: "dominantcolors",
    base_url: "https://github.com/29decibel/dominant_colors/releases/download/#{version}",
    force_build: System.get_env("DOMINANT_COLORS_BUILD") in ["1", "true"],
    version: version

  def dominant_colors(_file_name), do: :erlang.nif_error(:nif_not_loaded)
end
