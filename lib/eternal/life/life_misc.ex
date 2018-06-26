defmodule Eternal.Life.Misc do
  def pwd() do
    {path, 0} = System.cmd("pwd", [])
    String.trim(path)
  end

  def ls(path \\ nil) do
    path = path || pwd() <> eternal_path()
    {data, 0} = System.cmd("ls", [path])
    String.trim(data) |> String.split()
  end

  def eternal_path() do
    "/lib/eternal/"
  end

  def name_to_path(name) do
    pwd() <> eternal_path() <> name <> ".ex"
  end

  def remove(name) do
    path = name_to_path(name)
    File.rm(path)
  end

  def new(name, script) do
    path = name_to_path(name)

    if File.exists?(path) do
      {:error, :file_already_exists}
    else
      File.write!(path, script)
    end
  end

  def upsert(name, script) do
    path = name_to_path(name)
    File.write!(path, script)
  end

  def compile(script) do
    Code.compiler_options(ignore_module_conflict: true)
    Code.compile_string(script)
    :ok
  end
end
