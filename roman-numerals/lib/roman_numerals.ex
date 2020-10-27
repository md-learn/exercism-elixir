defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number
    |> to_roman
    |> Enum.join
  end

  defp to_roman(number) when number >= 1000, do: ["M" | to_roman(number - 1000)]
  defp to_roman(number) when number >= 900, do: ["CM" | to_roman(number - 900)]
  defp to_roman(number) when number >= 500, do: ["D" | to_roman(number - 500)]
  defp to_roman(number) when number >= 400, do: ["CD" | to_roman(number - 400)]
  defp to_roman(number) when number >= 100, do: ["C" | to_roman(number - 100)]
  defp to_roman(number) when number >= 90, do: ["XC" | to_roman(number - 90)]
  defp to_roman(number) when number >= 50, do: ["L" | to_roman(number - 50)]
  defp to_roman(number) when number >= 40, do: ["XL" | to_roman(number - 40)]
  defp to_roman(number) when number >= 10, do: ["X" | to_roman(number - 10)]
  defp to_roman(9), do: ["IX"]
  defp to_roman(number) when number >= 5, do: ["V" | to_roman(number - 5)]
  defp to_roman(4), do: ["IV"]
  defp to_roman(number) when number >= 1, do: ["I" | to_roman(number - 1)]
  defp to_roman(0), do: []
end
