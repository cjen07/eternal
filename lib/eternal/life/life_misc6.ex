defmodule Eternal.Life.Misc6 do
  def rd(n \\ "") do
    File.read!("./lib/eternal/life/life_misc#{n}.ex")
  end

  def ap(n \\ "", f) do
    alias Eternal.Life.Misc, as: M
    a = rd(n) |> String.trim() |> String.split_at(-3) |> elem(0)
    M.upsert("life_misc#{n}", (a <> f <> "\nend") |> Code.format_string!() |> Enum.join())
  end

  def fns(n \\ "") do
    Module.concat(["Eternal", "Life", "Misc#{n}"]).__info__(:functions)
  end

  def mcs(n \\ "") do
    Module.concat(["Eternal", "Life", "Misc#{n}"]).__info__(:macros)
  end

  def ar(n \\ "", f) do
    alias Eternal.Life.Misc, as: M
    a = rd(n) |> String.trim() |> String.split_at(-3) |> elem(0)
    M.upsert("life_misc#{n}", (a <> f <> "\nend") |> Code.format_string!() |> Enum.join())
    IEx.Helpers.recompile()
  end

  def fms(n \\ "") do
    %{fns: fns(n), mcs: mcs(n)}
  end

  def v(n) do
    Eternal.Life.Misc.new("life_misc#{n}", "defmodule Eternal.Life.Misc#{n} do end")
  end
end