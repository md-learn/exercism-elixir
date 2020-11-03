defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> do_encode(1)

  end

  defp do_encode("", _), do: ""
  defp do_encode(<<current, next, rest::binary>>, counter) when current == next do
    do_encode(to_string([next]) <> rest, counter + 1)
  end
  defp do_encode(<<current, rest::binary>>, 1) do
    to_string([current]) <> do_encode(rest, 1)
  end
  defp do_encode(<<current, rest::binary>>, counter) do
    Integer.to_string(counter) <> to_string([current]) <> do_encode(rest, 1)
  end

  defp do_encode(string, 1), do: string
  defp do_encode(string, counter), do: Integer.to_string(counter) <> string

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.scan(~r/\d*[\p{L}\s]/u, string)
    |> Enum.map(&do_decode/1)
    |> Enum.join("")
  end

  defp do_decode([""]), do: ""
  defp do_decode([string = <<_::utf8>>]), do: string
  defp do_decode([string]) do
    digits = byte_size(string) - 1
    <<num::binary-size(digits), char::binary>> = string
    String.duplicate(char, String.to_integer(num))
  end

end
