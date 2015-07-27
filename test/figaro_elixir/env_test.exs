defmodule FigaroElixir.EnvTest do
  use ExUnit.Case

  alias FigaroElixir.Env

  test "formatting keys to uppercase" do
    assert Env.upcase_keys(%{ "a" => "a" }) == %{ "A" => "a" }
  end
end
