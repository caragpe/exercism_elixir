defmodule ProteinTranslation do
   @codon_to_proteine %{
    :UGU => "Cysteine",
    :UGC => "Cysteine",
    :UUA => "Leucine",
    :UUG => "Leucine",
    :AUG => "Methionine",
    :UUU => "Phenylalanine",
    :UUC => "Phenylalanine",
    :UCU => "Serine",
    :UCC => "Serine",
    :UCA => "Serine",
    :UCG => "Serine",
    :UGG => "Tryptophan",
    :UAU => "Tyrosine",
    :UAC => "Tyrosine",
    :UAA => "STOP",
    :UAG => "STOP",
    :UGA => "STOP"
  }
  
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    String.to_char_list(rna)
    |> group_codon({:ok, []})
  end
  
  def group_codon([], {status, acc}), do: {status, acc}

  def group_codon([a,b,c | tail], {status, acc}) do
    codon_to_test = List.to_string([a] ++ [b] ++ [c])
    {codon_status, translation} = of_codon(codon_to_test)
    cond do
      #codon_status == :ok -> group_codon(tail, {status, Enum.uniq(acc ++ [translation])})
      codon_status == :ok -> build_proteint_list(tail, status, acc, translation)
      codon_status == :error -> {:error, "invalid RNA"}
    end
  end
  
  def group_codon([ _ | _tail], { _status, _acc}), do: {:error, "invalid rna"}
  def group_codon([ _ , _ | _tail ], { _status, _acc}), do: {:error, "invalid rna"}

  defp build_proteint_list(pending_codons, status, acc, translation) do
    protein_list = Enum.uniq(acc ++ [translation])
    cond do
      translation == "STOP" -> group_codon([], {status, acc })
      translation != "STOP" -> group_codon(pending_codons, {status, protein_list})
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
      result =  @codon_to_proteine[String.to_atom(codon)]
      if result do
        {:ok, result}
      else
        {:error, "invalid codon"}
      end
  end
  

end

