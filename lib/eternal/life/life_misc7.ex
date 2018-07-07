defmodule Eternal.Life.Misc7 do
  def rlm(n, l, r) do
    Enum.map(1..r, fn _ -> rl(n, l) end)
  end

  def rl(n, l) do
    alias Eternal.Life.Misc6, as: M6
    a = M6.rd(n) |> String.split("\n") |> List.delete_at(l - 1) |> Enum.join("\n")
    alias Eternal.Life.Misc1, as: M1
    M1.upsert("life_misc#{n}", a)
  end

  def mr(n, l, r) do
    rlm(n, l, r)
    IEx.Helpers.recompile()
  end
end
