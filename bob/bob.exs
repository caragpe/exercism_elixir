defmodule Bob do
  def hey(input) do
    clean_string = cleanup_string(input)
    cond do
        check_question(clean_string) == :true -> "Sure."
        check_shouting(clean_string) == :true -> "Whoa, chill out!"
        check_silence(clean_string) == :true -> "Fine. Be that way!"
        :true -> "Whatever."
    end
  end
  
  def cleanup_string(input) do
    String.replace(input,~r/[\s]*[\d]*/,"")
  end
  
  def check_question(input) do
    Regex.match?(~r/^.*[\?]$/, input)
  end
  
  def check_shouting(input) do
    Regex.match?(~r/^[[:punct:]]*[A-Z]+[A-Z[:punct:]]*$/u, input)
  end
  
  def check_silence(input) do
    Regex.match?(~r/^[[:space:]]*$/, input)
  end
end
