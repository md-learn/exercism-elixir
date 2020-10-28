defmodule Bob do
  def hey(input) do
    input = String.trim(input)
    cond do
      silence?(input) -> "Fine. Be that way!"
      shouting?(input) && question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  def silence?(input), do: input == ""
  def question?(input), do: String.ends_with?(input, "?")
  def shouting?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end
end
