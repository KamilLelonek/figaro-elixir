defmodule FigaroElixir.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :figaro_elixir,
      version:         "0.0.1",
      elixir:          "~> 1.0",
      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,
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
end
