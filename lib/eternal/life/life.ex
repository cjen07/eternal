defmodule Eternal.Life do
  alias Eternal.Life.Misc1, as: M1

  def change(name, code) do
    script = Code.format_string!(code) |> Enum.join()
    M1.compile(script)
    M1.upsert(name, script)
  end

  defmacro gen_alias(n) do
    1..n
    |> Enum.map(fn x -> "alias Eternal.Life.Misc#{x}, as: M#{x}" end)
    |> Enum.join("\n")
    |> Code.string_to_quoted()
  end

  defmacro gen_imports_and_requires(n) do
    n
    |> Enum.map(fn x -> "import M#{x}; require M#{x}" end)
    |> Enum.join("\n")
    |> Code.string_to_quoted()
  end
end
