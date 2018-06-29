defmodule Eternal.Application do
  use Application

  alias Eternal.Life

  def start(_type, _args) do
    children = [
      Life.Misc4
    ]

    opts = [strategy: :one_for_one, name: Eternal.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
