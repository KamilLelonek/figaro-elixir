defmodule FigaroElixir.Yaml do
  @config_path "config/application.yml"

  def load_file(path \\ @config_path) do
    file = config_file(path)
    cond do
      File.exists?(file) -> parse_file(file)
      true               -> raise "#{file} file not found"
    end
  end

  defp config_file(path), do: File.cwd! |> Path.join(path)

  defp parse_file(file_path) do
    file_path
      |> Yomel.decode_file
      |> extract_map
    rescue
      e in FunctionClauseError -> %{}
  end

  defp extract_map({ :ok, [""] }),     do: %{}
  defp extract_map({ :ok, [result] }), do: result
end
