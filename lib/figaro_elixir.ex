defmodule FigaroElixir do
  def start(_type, _args) do
    import Supervisor.Spec

    children = []
    options  = [strategy: :one_for_one, name: Figaro.Supervisor]

    Supervisor.start_link(children, options)
  end
end
