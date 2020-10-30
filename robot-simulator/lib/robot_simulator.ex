defmodule RobotSimulator do
  @directions [:north, :east, :west, :south]
  defstruct [:position, :direction]

  defguard is_valid_position(position) when
    Kernel.is_tuple(position) and
    tuple_size(position) == 2 and
    Kernel.is_integer(elem(position, 0)) and
    Kernel.is_integer(elem(position, 1))

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})
  def create(direction, position) when direction in @directions and is_valid_position(position) do
    %RobotSimulator{position: position, direction: direction}
  end
  def create(_, position) when not is_valid_position(position), do: {:error, "invalid position"}
  def create(_, _), do: {:error, "invalid direction"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    do_simulate(robot, String.codepoints(instructions))
  end

  defp do_simulate(_, [next | _]) when next not in ["L", "R", "A"], do: {:error, "invalid instruction"}
  defp do_simulate(robot, [next | rest]) do
    next_direction = next_direction(direction(robot), next)
    if next_direction != direction(robot) do
      do_simulate(%{robot | direction: next_direction}, rest)
    else
      do_simulate(advance(robot), rest)
    end
  end
  defp do_simulate(robot, []), do: robot

  defp next_direction(:north, "L"), do: :west
  defp next_direction(:north, "R"), do: :east
  defp next_direction(:south, "L"), do: :east
  defp next_direction(:south, "R"), do: :west
  defp next_direction(:east, "L"), do: :north
  defp next_direction(:east, "R"), do: :south
  defp next_direction(:west, "L"), do: :south
  defp next_direction(:west, "R"), do: :north
  defp next_direction(start, "A"), do: start

  defp advance(robot = %RobotSimulator{position: {x, y}, direction: :north}), do: %{robot | position: {x, y + 1}}
  defp advance(robot = %RobotSimulator{position: {x, y}, direction: :south}), do: %{robot | position: {x, y - 1}}
  defp advance(robot = %RobotSimulator{position: {x, y}, direction: :east}), do: %{robot | position: {x + 1, y}}
  defp advance(robot = %RobotSimulator{position: {x, y}, direction: :west}), do: %{robot | position: {x - 1, y}}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end
