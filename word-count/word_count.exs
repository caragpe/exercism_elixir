defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    myString = String.downcase(sentence)
    |> String.replace(~r{[.,:;'"!?@#$%^&*()_]}, " ")
    |> String.split(" ", trim: true)
    
    myString |> Enum.uniq |> myMap(myString)
  end
  
  defp myMap(unique_words, original_string) do
    Map.new(unique_words, fn s ->{s,check_string(original_string, s, 0)} end)
  end
  
  defp check_string([], value, acc), do: acc
  defp check_string([value | tail], value, acc), do: check_string(tail, value, acc + 1)
  defp check_string([_|tail], value, acc), do: check_string(tail, value, acc)
end
