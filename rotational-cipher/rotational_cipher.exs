defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @start_A 65
  @total_letters 26
  
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    to_charlist(text) ++ [0]
    |> _rotate  shift, ""
  end
  
  defp _rotate([0], shift , new_string) do
    new_string
  end
    
  defp _rotate([head | tail], shift , new_string) do
    _rotate(tail, shift, new_string <> shift_letter(head, shift))
  end
  
  defp shift_letter(current_position, shift) do
    new_position = 1 + current_position - @start_A  + shift -(@total_letters)*div(current_position - @start_A + shift,@total_letters)
    <<new_position + @start_A - 1>>  
  end
end

