defmodule SecretHandshake do
  @commands %{1 => "wink", 2 => "double blink", 4 => "close your eyes", 8 => "jump"}
  @reverse 16

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    @commands
    |> Enum.filter(&add_command?(&1, code))
    |> Enum.map(fn {_, v} -> v end)
    |> reverse(add_command?({@reverse, nil}, code))
  end

  defp add_command?({command, _}, code) do
    use Bitwise, only_operators: true
    (code &&& command) == command
  end

  defp reverse(commands, true), do: Enum.reverse(commands)
  defp reverse(commands, false), do: commands

end
