defmodule YamlExt do
  def decode_file(file_path) do
    case :yamerl_constr.file(file_path, detailed_constr: true) do
      [{ _, document }] -> decode(document)
      _                 -> %{}
    end
  end

  defp decode(document) do
    case _to_map(document) do
      ""      -> %{}
      decoded -> decoded
    end
  end

  defp _to_map({ :yamerl_seq, :yamerl_node_seq, _tag, _loc, seq, _n }),
  do:  Enum.map(seq, &_to_map(&1))

  defp _to_map({ :yamerl_map, :yamerl_node_map, _tag, _loc, map_tuples }),
  do:  _tuples_to_map(map_tuples, %{})

  defp _to_map({ _yamler_element, _yamler_node_element, _tag, _loc, elem }),
  do:  to_string(elem)

  defp _to_map({ _yamler_element, _yamler_node_element, _tag, _loc }),
  do:  ""

  defp _tuples_to_map([], map),
  do:  map

  defp _tuples_to_map([{ key, val } | rest], map) do
    case key do
      { :yamerl_str, :yamerl_node_str, _tag, _log, name } ->
         _tuples_to_map(rest, Dict.put_new(map, to_string(name), _to_map(val)))
    end
  end
end
