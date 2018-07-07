defmodule Eternal.Life.Misc1 do
  @moduledoc "this is the first life misc module"
  alias Eternal.Life.Misc4

  @doc "print working directory "
  def pwd() do
    {path, 0} = System.cmd("pwd", [])
    String.trim(path)
  end

  @doc "list segment"
  def ls(path \\ nil) do
    path = path || pwd() <> eternal_path()
    {data, 0} = System.cmd("ls", [path])
    String.trim(data) |> String.split()
  end

  @doc "static path lib eternal"
  def lib_path() do
    "/lib/eternal/"
  end

  @doc "dynamic eternal path, frequently used by other functions"
  def eternal_path() do
    lib_path() <> Misc4.fetch_path() <> "/"
  end

  @doc "from no extension filename to a dynamic path"
  def name_to_path(name) do
    pwd() <> eternal_path() <> name <> ".ex"
  end

  @doc "remove using filename, no extension, no path"
  def remove(name) do
    path = name_to_path(name)
    File.rm(path)
  end

  @doc "new file using filename, script is optional"
  def new(name, script \\ "") do
    path = name_to_path(name)

    if File.exists?(path) do
      {:error, :file_already_exists}
    else
      File.write!(path, script)
    end
  end

  @doc "upsert using filename, frequently used before M8"
  def upsert(name, script \\ "") do
    path = name_to_path(name)
    File.write!(path, script)
  end

  @doc "a wrapper to compile string without warning"
  def compile(script) do
    Code.compiler_options(ignore_module_conflict: true)
    Code.compile_string(script)
    :ok
  end
end