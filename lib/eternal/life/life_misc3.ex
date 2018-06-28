defmodule Eternal.Life.Misc3 do
  alias Eternal.Life.{Misc, Misc2}

  defmacro n(data, script \\ "") do
    case parse_name(data) do
      "-" <> name -> Misc2.new_space(name)
      name -> Misc.new(name, script)
    end
  end

  defmacro rm(data) do
    case parse_name(data) do
      "-" <> name -> Misc2.remove_space(name)
      name -> Misc.remove(name)
    end
  end

  defp parse_name(name) do
    Macro.to_string(name) |> String.replace(" ", "")
  end
end
