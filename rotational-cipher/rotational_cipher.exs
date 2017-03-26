defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    _rotate(String.to_charlist(text), shift)
    |> List.to_string
  end
  
  defp _rotate([], _), do: ''
  defp _rotate([h | t], shift), do: [rotate_letter(h, shift)] ++ _rotate(t, shift)
  
  defp rotate_letter(letter, shift) when letter >= ?a and letter <= ?z do
    calculate_real_shif(letter, shift, ?a)
  end
  
  defp rotate_letter(letter, shift) when letter >= ?A and letter <= ?Z do
    calculate_real_shif(letter, shift, ?A)
  end
  
  defp rotate_letter(letter, shift), do: letter

  defp calculate_real_shif(letter, original_shift, initial_position) do
    offset = letter - initial_position
    cond do
      0     == div(offset + original_shift, 26) -> letter + original_shift
      0     < div(offset + original_shift, 26) -> initial_position + rem(offset + original_shift, 26)
    end
  end
end