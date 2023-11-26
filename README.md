# DominantColors

![livebook dominant colors usage](screenshots/livebook.png)

> Working in progress

Extract dominant colors from given image path. Wrapper around the awesome Rust library [kmeans_colors](https://github.com/okaneco/kmeans-colors).


## Installation

```elixir
def deps do
  [
    {:dominant_colors, "~> 0.1.4"}
  ]
end
```

## Usage

```elixir
file_path = "test-image.png"
colors = DominantColors.dominant_colors(file_path)
# {:ok , ["#b49480", "#4b2e24", "#201310", "#7e99c5", "#947260", "#715042", "#94aacc", "#d1b8a7"] }
```

