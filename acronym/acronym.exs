defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    splitting(string)
    |> Enum.map(&List.first/1)
    |> List.to_string
    |> String.upcase
  end
  
  def splitting(myString) do
    String.split(myString, ~r{(?=[A-Z])|[\s[:punct:]]})
    |> Enum.filter(fn x -> String.length(x) > 0 end)
    |> Enum.map(fn x -> to_charlist(x) end)
  end

end