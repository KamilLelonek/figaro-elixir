defmodule FigaroElixir.Env do
  def upcase_keys(map) do
    map
      |> map_all_key_to_uppercase
      |> convert_array_to_map
  end

  defp upcase_keys_transformation({key, value}), do: { String.upcase(key), value }
  defp map_all_key_to_uppercase(map),            do: map   |> Enum.map(&upcase_keys_transformation/1)
  defp convert_array_to_map(array),              do: array |> Enum.into(%{})
end
