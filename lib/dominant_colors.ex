defmodule DominantColors do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :dominant_colors,
    crate: "dominantcolors",
    base_url: "https://github.com/29decibel/dominant_colors/releases/download/#{version}",
    force_build: System.get_env("DOMINANT_COLORS_BUILD") in ["1", "true"],
    version: version,
    # default without aarch64-unknown-linux-musl
    targets: ~w(
      aarch64-apple-darwin
      aarch64-unknown-linux-gnu
      arm-unknown-linux-gnueabihf
      riscv64gc-unknown-linux-gnu
      x86_64-apple-darwin
      x86_64-pc-windows-gnu
      x86_64-pc-windows-msvc
      x86_64-unknown-linux-gnu
      x86_64-unknown-linux-musl
    )

  def dominant_colors(_file_name), do: :erlang.nif_error(:nif_not_loaded)
end
