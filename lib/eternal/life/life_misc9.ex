defmodule Eternal.Life.Misc9 do
  def pi do
    IO.inspect(Process.info(self)[:dictionary][:iex_history].queue)
    :ok
  end
end
