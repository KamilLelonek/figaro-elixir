defmodule FigaroElixir.Env do
  def update_env(config) do
    config
      |> upcase_keys
      |> put_or_delete_env
  end

  def put_or_delete_env(map) do
    Enum.each(
      map,
      fn { key, value } ->
        put_or_delete_env(key, value)
      end
    )
  end

  def put_or_delete_env(key, "~"), do: System.delete_env(key)
  def put_or_delete_env(key, val), do: System.put_env(key, val)

  def upcase_keys(map) do
    map
      |> map_all_key_to_uppercase
      |> convert_array_to_map
  end

  defp upcase_keys_transformation({key, value}), do: { String.upcase(key), to_string(value) }
  defp map_all_key_to_uppercase(map),            do: map   |> Enum.map(&upcase_keys_transformation/1)
  defp convert_array_to_map(array),              do: array |> Enum.into(%{})
end
