defmodule DominantColors do
  # use Rustler,
  #   otp_app: :dominant_colors,
  #   crate: :dominantcolors

  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :dominant_colors,
    crate: "dominantcolors",
    base_url: "https://github.com/29decibel/dominant_colors/releases/download/#{version}",
    force_build: System.get_env("DOMINANT_COLORS_BUILD") in ["1", "true"],
    version: version

  # When loading a NIF module, dummy clauses for all NIF function are required.
  # NIF dummies usually just error out when called when the NIF is not loaded, as that should never normally happen.

  def dominant_colors(_file_name), do: :erlang.nif_error(:nif_not_loaded)
end

# https://github.com/29decibel/dominant_colors/releases/download/0.1.0/libdominantcolors-v0.1.0-nif-2.15-aarch64-apple-darwin.so.tar.gz
# https://github.com/29decibel/dominant_colors/releases/download/0.1.0/libdominantcolors-v-nif-2.15-arm-unknown-linux-gnueabihf.so.tar.gz
