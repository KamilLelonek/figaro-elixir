defmodule FigaroElixir.Config do
  def extract(config) do
    Map.merge(
      get_default_config(config),
      get_env_config(config)
    ) |> stringify_values
  end

  defp stringify_values(map),           do: Enum.into(map, %{}, &stringify_value/1)
  defp stringify_value({ key, value }), do: { key, to_string(value)}

  def get_default_config(config) do
    config
      |> filter_maps
      |> Enum.into(Map.new)
  end

  defp filter_maps(config) do
    Enum.filter(
      config,
      &is_regular_pair?/1
    )
  end

  defp is_regular_pair?({_, value}), do: !is_map(value)

  defp get_env_config(config) do
    case take_env_map(config) do
      nil        -> %{}
      { _, map } -> map
    end
  end

  defp take_env_map(config) do
    config
      |> Enum.filter(&has_map_value?/1)
      |> List.last
  end

  defp has_map_value?({ key, value }) do
    key == to_string(Mix.env) && is_map(value)
  end
end
