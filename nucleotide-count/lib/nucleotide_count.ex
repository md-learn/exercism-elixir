defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    strand |> histogram() |> Map.get(nucleotide, 0)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    histogram(
      strand,
      @nucleotides
      |> Map.new(fn x -> {x, 0} end)
    )
  end

  def histogram([hd | tl], acc) do
    acc = Map.update!(acc, hd, &(&1 + 1))
    histogram(tl, acc)
  end

  def histogram([], acc) do
    acc
  end
end
