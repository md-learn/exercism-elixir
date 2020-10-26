defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(" ")
    |> Enum.flat_map(&(String.split(&1, "_")))
    |> Enum.map(&replacePunct/1)
    |> Enum.filter(&(byte_size(&1) != 0))
    |> Enum.frequencies()
  end

  defp replacePunct(sentence) do
    Regex.replace(~r/[[:punct:]]+$/, sentence, "")
  end
end
