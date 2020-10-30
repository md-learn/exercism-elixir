defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

  defguard has_factor_3?(number) when rem(number, 3) == 0
  defguard has_factor_5?(number) when rem(number, 5) == 0
  defguard has_factor_7?(number) when rem(number, 7) == 0
  defguard has_no_factor_3_5_7?(number) when not has_factor_3?(number) and not has_factor_5?(number) and not has_factor_7?(number)

  @spec convert(pos_integer) :: String.t()
  def convert(number), do: convert(number, rem(number, 3), rem(number, 5), rem(number, 7))

  def convert(_, 0, 0, 0), do: "PlingPlangPlong"
  def convert(_, 0, 0, _), do: "PlingPlang"
  def convert(_, 0, _, 0), do: "PlingPlong"
  def convert(_, 0, _, _), do: "Pling"
  def convert(_, _, 0, 0), do: "PlangPlong"
  def convert(_, _, 0, _), do: "Plang"
  def convert(_, _, _, 0), do: "Plong"
  def convert(number, _, _, _), do: Integer.to_string(number)
end
