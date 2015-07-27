defmodule FigaroElixir.Yaml do
  def parse_file(file_path) do
    file_path
      |> Yomel.decode_file
      |> extract_map
  end

  defp extract_map({ :ok, [result] }), do: result
end
