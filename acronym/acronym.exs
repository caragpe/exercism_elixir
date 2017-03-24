defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    splitting(string)
    |> Enum.map(&getSignificantLetters/1)
    |> List.to_string
    |> String.upcase
  end
  
  def splitting(myString) do
    String.split(myString, ~r{[\s[:punct:]]+})
    |> Enum.filter(fn x -> String.length(x) > 0 end)
    |> Enum.map(fn x -> to_charlist(x) end)
  end
  
  def getSignificantLetters([h|t]) do
    _getSignificantLetters(t, [] ++ [h])
  end
  
  defp _getSignificantLetters([], acc), do: acc
  defp _getSignificantLetters([h|t], acc) do
    cond do
      {:true}  == _checkCapital(h) -> _getSignificantLetters(t, acc ++ [h])
      {:false} == _checkCapital(h) -> _getSignificantLetters(t, acc)
    end
  end
  
  defp _checkCapital(character) when character in 65..90, do: {:true} # 65 = A and 90 = Z
  defp _checkCapital(character), do: {:false} 

end