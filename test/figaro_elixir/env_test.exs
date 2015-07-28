defmodule FigaroElixir.EnvTest do
  use ExUnit.Case

  alias FigaroElixir.Env

  test "formatting keys to uppercase" do
    assert Env.upcase_keys(%{ "a" => "a" }) == %{ "A" => "a" }
  end

  test "updating system environmental variables" do
    config = %{"a" => "1"}

    Env.update_env(config)

    assert System.get_env("A") == "1"
  end

  test "nullify system variables" do
    config = %{"b" => ""}

    System.put_env("B", "B")

    assert System.get_env("B") == "B"

    Env.update_env(config)

    assert System.get_env("B") == nil
  end
end
