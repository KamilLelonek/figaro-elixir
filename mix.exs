defmodule FigaroElixir.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :figaro_elixir,
      version:         "0.0.1",
      elixir:          "~> 1.0",
      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description:     description,
      package:         package,
      deps:            deps
    ]
  end

  def application do
    [
      mod:          { FigaroElixir, [] },
      applications: apps
    ]
  end

  defp apps do
    [
      :logger
    ]
  end

  defp deps do
    [
      { :yomel, "~> 0.2.2" }
    ]
  end

  defp description do
    """
    Environmental variables manager and configuration management tool.
    """
  end

  defp package do
    [
      files:        ["lib", "config", "mix.exs", "README.md"],
      contributors: ["Kamil Lelonek"],
      licenses:     ["MIT"],
      links:        %{ "GitHub" => "https://github.com/KamilLelonek/figaro-elixir" }
    ]
  end
end
