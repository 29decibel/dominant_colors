defmodule DominantColors.MixProject do
  use Mix.Project

  # this is important as the github workflow relies on this to grab the correct version
  @version "0.1.1"

  def project do
    [
      app: :dominant_colors,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description() do
    "Extract dominant colors from given image (using kmeans), wrapper on top of rust kmeans_colors."
  end

  defp package() do
    [
      name: "dominant_colors",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/29decibel/dominant_colors"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.30.0"},
      {:rustler_precompiled, "~> 0.7"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
