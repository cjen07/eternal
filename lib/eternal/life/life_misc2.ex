defmodule Eternal.Life.Misc2 do
  alias Eternal.Life.Misc

  def space_to_path(space) do
    Misc.pwd() <> Misc.eternal_path() <> space
  end

  def new_space(space) do
    path = space_to_path(space)
    {_, 0} = System.cmd("mkdir", ["-p", path])
    :ok
  end

  def remove_space(space) do
    path = space_to_path(space)
    {_, 0} = System.cmd("rm", ["-r", path])
    :ok
  end

  def pick(name) do
    see(name, false)
  end

  def see(name, with_line \\ true) do
    path = Misc.name_to_path(name)
    {data, 0} = System.cmd("cat", [path])

    data =
      data
      |> String.trim()
      |> String.split("\n")

    if with_line do
      l = length(data)
      ll = String.length(to_string(l))

      Enum.zip(1..l, data)
      |> Enum.map(fn {i, d} ->
        String.pad_leading(to_string(i), ll) <> "|" <> d
      end)
    else
      data
    end
    |> Enum.map(&IO.puts/1)

    :ok
  end
end
