defmodule Bob do
  def hey(input) do
    cond do
        check_question(input) == :true -> "Sure."
        check_shouting(input) == :true -> "Whoa, chill out!"
        check_silence(input) == :true -> "Fine. Be that way!"
        :true -> "Whatever."
    end
  end
  
  def check_question(input) do
    Regex.match?(~r/^[a-z]*[A-Z]{1,}[\d\W]*[\?]{1,}$/, input)
  end
  
  def check_shouting(input) do
    Regex.match?(~r/^[A-Z0-9]{1,}[\s\W]*[^\?]+$/, input)
  end
  
  def check_silence(input) do
    Regex.match?(~r/^[\s]*$/, input)
  end
end
