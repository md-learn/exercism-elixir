defmodule PigLatin do
  defguard is_vowel?(char) when char in 'aeiou'

  @suffix "ay"

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&do_translate/1)
    |> Enum.join(" ")
  end

  defp do_translate(word = <<"x", ch, _::binary>>) when not is_vowel?(ch), do: word <> @suffix
  defp do_translate(word = <<"y", ch, _::binary>>) when not is_vowel?(ch), do: word <> @suffix
  defp do_translate(word = <<ch, _::binary>>) when is_vowel?(ch), do: word <> @suffix
  defp do_translate("qu" <> rest), do: rest <> "qu" <> @suffix
  defp do_translate(<<hd, tl::binary>>), do: do_translate(tl <> to_string([hd]))

end
