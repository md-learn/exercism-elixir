defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size), do: String.codepoints(s) |> do_slice(size)

  defp do_slice(list = [_ | tl], size) when length(list) >= size and size > 0 do
    [take(list, size) | do_slice(tl, size)]
  end
  defp do_slice(_, _), do: []
  defp take(list, size), do: Enum.take(list, size) |> Enum.join

end
