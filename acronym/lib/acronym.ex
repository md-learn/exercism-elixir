defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.split(string, [" ", "-", "_"], trim: true)
    |> Enum.map(&get_upper_char/1)
    |> Enum.join
  end

  defp get_upper_char(<<first, rest::binary>>) do
    capitalized = String.upcase(to_string [first]) <> rest
    Regex.scan(~r/^[[:upper:]]|(?<=[[:lower:]])[[:upper:]]/, capitalized)
    |> List.flatten
  end
end
