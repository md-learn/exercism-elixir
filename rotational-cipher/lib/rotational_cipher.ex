defmodule RotationalCipher do

  defguard is_lower_case?(char) when char in ?a..?z
  defguard is_upper_case?(char) when char in ?A..?Z

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(&rotate_char(&1, shift))
    |> to_string
  end

  defp rotate_char(char, shift) when is_lower_case?(char), do: rotate_char(char, shift, ?z)
  defp rotate_char(char, shift) when is_upper_case?(char), do: rotate_char(char, shift, ?Z)
  defp rotate_char(char, _shift), do: char

  defp rotate_char(char, shift, z) when char + shift > z, do: char + shift - 26
  defp rotate_char(char, shift, _z), do: char + shift

end
