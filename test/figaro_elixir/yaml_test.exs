defmodule FigaroElixir.YamlTest do
  use ExUnit.Case

  alias FigaroElixir.Yaml

  test "parsing flat file contents" do
    assert_result "flat", %{ "a" => "a", "b" => 1, "c" => "true" }
  end

  test "parsing nested file contents" do
    assert_result "nested", %{
                                "dev"  => %{"A" => 1234, "B" => 1234},
                                "prod" => %{"A" => "12ab", "B" => "34bc"},
                                "test" => %{"A" => "abcd", "B" => "abcd"}
                              }
  end

  test "parsing nullified file contents" do
    assert_result "nullify", %{"a" => 1, "b" => "~"}
  end

  test "parsing multi file contents" do
    assert_result "multi", %{"a" => "a", "test" => %{"b" => 1}}
  end

  defp assert_result(file_name, expectation) do
    assert Yaml.parse_file("test/fixtures/#{file_name}.yml") == expectation
  end
end
