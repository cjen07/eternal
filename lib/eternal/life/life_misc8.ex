defmodule Eternal.Life.Misc8 do
  def cp(n, l) do
    Eternal.Life.Misc6.rd(n) |> String.trim() |> String.split("\n") |> Enum.at(l - 1)
  end

  def up(f, n) do
    Eternal.Life.Misc1.upsert("life_misc#{n}", f)
  end

  def dt(n, l, f) do
    Eternal.Life.Misc6.rd(n)
    |> String.trim()
    |> String.split("\n")
    |> List.update_at(l - 1, fn _ -> f end)
    |> Enum.join("\n")
    |> Code.format_string!()
    |> up(n)

    IEx.Helpers.recompile()
  end

  def ad(n, l, f) do
    Eternal.Life.Misc6.rd(n)
    |> String.trim()
    |> String.split("\n")
    |> List.update_at(l - 1, fn x -> f <> "\n" <> x end)
    |> Enum.join("\n")
    |> Code.format_string!()
    |> up(n)

    IEx.Helpers.recompile()
  end
end