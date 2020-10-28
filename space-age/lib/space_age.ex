defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    calculate_age_on(planet, seconds/31557600)
  end

  defp calculate_age_on(:mercury, earth_years), do: earth_years / 0.2408467
  defp calculate_age_on(:venus, earth_years), do: earth_years / 0.61519726
  defp calculate_age_on(:earth, earth_years), do: earth_years
  defp calculate_age_on(:mars, earth_years), do: earth_years / 1.8808158
  defp calculate_age_on(:jupiter, earth_years), do: earth_years / 11.862615
  defp calculate_age_on(:saturn, earth_years), do: earth_years / 29.447498
  defp calculate_age_on(:uranus, earth_years), do: earth_years / 84.016846
  defp calculate_age_on(:neptune, earth_years), do: earth_years / 164.791325

end
