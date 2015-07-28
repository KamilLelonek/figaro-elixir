defmodule FigaroElixir do
  use Application

  alias FigaroElixir.Yaml
  alias FigaroElixir.Config
  alias FigaroElixir.Env

  @agent_name :config

  defp children,            do: [Supervisor.Spec.worker(FigaroElixir, [])]
  defp options,             do: [strategy: :one_for_one, name: FigaroElixir.Supervisor]
  def  start(_, _),         do: Supervisor.start_link(children, options)

  def  env,                 do: Agent.get(@agent_name, &(&1))
  defp start_agent(config), do: Agent.start_link(fn -> config end, name: @agent_name)

  def start_link do
    config = Yaml.load_file |> Config.extract
    Env.update_env(config)
    start_agent(config)
  end
end
