defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: do_count(l, 0)
  defp do_count([], counter), do: counter
  defp do_count([_ | tl], counter), do: do_count(tl, counter + 1)

  @spec reverse(list) :: list
  def reverse(l), do: do_revert(l, [])
  defp do_revert([], acc), do: acc
  defp do_revert([elem], acc), do: [elem | acc]
  defp do_revert([hd | tl], acc) do
    acc = [hd | acc]
    do_revert(tl, acc)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: for elem <- l, do: f.(elem)

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: for elem <- l, f.(elem), do: elem

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(l, acc, f) do
    l
    |> do_reduce(acc, f)
  end
  defp do_reduce([], acc, _), do: acc
  defp do_reduce([elem], acc, f), do: f.(elem, acc)
  defp do_reduce([hd | tl], acc, f), do: do_reduce(tl, f.(hd, acc), f)

  @spec append(list, list) :: list
  def append(a, b) do
    a
    |> reverse
    |> do_append(b)
  end
  defp do_append([], list), do: list
  defp do_append([elem], list), do: [elem | list]
  defp do_append([hd | tl], list), do: do_append(tl, [hd | list])

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    ll
    |> reverse
    |> reduce([], &append/2)
  end

end
