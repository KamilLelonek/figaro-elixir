defmodule FigaroElixir.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :figaro_elixir,
      version:         "1.0.0",
      elixir:          "~> 1.3",
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
      :logger,
      :yamerl
    ]
  end

  defp deps do
    [
      { :yamerl, github: "yakaz/yamerl" }
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
