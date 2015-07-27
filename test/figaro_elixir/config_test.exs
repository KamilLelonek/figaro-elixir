defmodule FigaroElixir.ConfigTest do
  use ExUnit.Case

  alias FigaroElixir.Config

  test "should extract and merge configs" do
    assert Config.extract(%{"a" => "a", "test" => %{"b" => 1}}) == %{"a" => "a", "b" => 1}
  end

  test "should extract and reject configs" do
    assert Config.extract(%{"a" => "a", "prod" => %{"b" => 1}}) == %{"a" => "a"}
  end
end
