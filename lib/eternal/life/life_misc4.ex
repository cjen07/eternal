defmodule Eternal.Life.Misc4 do
  use GenServer
  alias Eternal.Life.Misc

  def start_link(_args) do
    GenServer.start_link(__MODULE__, %{dir: nil}, name: __MODULE__)
  end

  def init(state) do
    new_state = %{state | dir: ""}
    {:ok, new_state}
  end

  def jump(path) do
    GenServer.call(__MODULE__, {:jump, path})
  end

  def fetch_path() do
    GenServer.call(__MODULE__, :fetch)
  end

  def handle_call(:fetch, _from, state) do
    {:reply, state.dir, state}
  end

  def handle_call({:jump, path}, _from, state) do
    full_path = Misc.pwd() <> Misc.lib_path() <> path

    case System.cmd("ls", [full_path], stderr_to_stdout: true) do
      {_, 0} ->
        IEx.configure(default_prompt: "%counter/#{path} ~>")
        new_state = %{state | dir: path}
        {:reply, :ok, new_state}

      _ ->
        {:reply, :error, state}
    end
  end
end
