defmodule FigaroElixirTest do
  use ExUnit.Case

  setup do
    System.put_env("B", "B")
    System.put_env("D", "D")
    Application.start(:figaro_elixir)

    on_exit fn ->
      Application.stop(:figaro_elixir)
      System.delete_env("A")
      System.delete_env("C")
    end
  end

  test "parsing config.yml file" do
    assert FigaroElixir.env["a"] == "a"
    assert FigaroElixir.env["c"] == "1"
  end

  test "loading into system environment" do
    assert System.get_env("A") == "a"
    assert System.get_env("C") == "1"
  end

  test "loading into system environment nullifies environment-specifc overrides" do
    assert System.get_env("B") == nil
    assert System.get_env("D") == nil
  end

  test "raises an error if application.yml isn't found" do
    assert { :error, _reason } = Application.start(:figaro)
  end
end
