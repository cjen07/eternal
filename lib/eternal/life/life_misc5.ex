defmodule Eternal.Life.Misc5 do
  alias Eternal.Life.{Misc3, Misc4}

  def j() do
    Misc4.jump("")
  end

  defmacro j(data) do
    Misc4.jump(Misc3.parse_name(data))
  end

  def bk(num \\ 1) do
    Misc4.back(num)
  end
end