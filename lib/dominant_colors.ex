defmodule DominantColors do
  use Rustler,
    otp_app: :dominant_colors,
    crate: :dominantcolors

  # When loading a NIF module, dummy clauses for all NIF function are required.
  # NIF dummies usually just error out when called when the NIF is not loaded, as that should never normally happen.

  def dominant_colors(_file_name), do: :erlang.nif_error(:nif_not_loaded)
end
