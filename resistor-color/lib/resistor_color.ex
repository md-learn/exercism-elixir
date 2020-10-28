defmodule ResistorColor do
  @moduledoc false

  @colors %{
    0 => "black",
    1 => "brown",
    2 => "red",
    3 => "orange",
    4 => "yellow",
    5 => "green",
    6 => "blue",
    7 => "violet",
    8 => "grey",
    9 => "white",
  }

  @spec colors() :: list(String.t())
  def colors do
    Map.values(@colors)
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    Enum.find_index(Map.values(@colors), fn el -> el == color end)
  end
end
