defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    _count(strand, nucleotide, 0)
  end

  
  defp _count([], nucleotide, times), do: times
  defp _count([ nucleotide | tail ], nucleotide, times), do: _count(tail, nucleotide, 1 + times)
  defp _count([ _ | tail ], nucleotide, times ), do: _count(tail, nucleotide, times)
  


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.map(@nucleotides, fn nuc -> {nuc,count(strand, nuc)} end) |> Map.new
  end
end
