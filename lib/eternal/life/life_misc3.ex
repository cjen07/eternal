defmodule Eternal.Life.Misc3 do
  alias Eternal.Life.{Misc1, Misc2}

  defmacro n(data, script \\ "") do
    case parse_name(data) do
      "-" <> name -> Misc2.new_space(name)
      name -> Misc1.new(name, script)
    end
  end

  defmacro rm(data) do
    case parse_name(data) do
      "-" <> name -> Misc2.remove_space(name)
      name -> Misc1.remove(name)
    end
  end

  defmacro pick(data) do
    Misc2.see(parse_name(data), false)
  end

  defmacro see(data, with_line \\ true) do
    Misc2.see(parse_name(data), with_line)
  end

  def parse_name(name) do
    Macro.to_string(name) |> String.replace(" ", "")
  end

  def pg(n) do
    Eternal.Life.Misc2.see("life_misc" <> to_string(n), false)
  end

  def ce(n) do
    Eternal.Life.Misc2.see("life_misc" <> to_string(n), true)
  end
end
