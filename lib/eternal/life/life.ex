defmodule Eternal.Life do
  alias Eternal.Life.Misc, as: ELM

  def change(name, code) do
    script = Code.format_string!(code) |> Enum.join()
    ELM.compile(script)
    ELM.upsert(name, script)
  end
end
