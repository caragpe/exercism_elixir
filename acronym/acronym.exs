defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
  end
  
  def splitting(myString) do
    String.split(myString, ~r{[\s[[:punct:]]]*})
    |> Enum.filter(fn x -> String.length(x) > 0 end)
  end
end
